@extends('admin.layout')

@section('content')
<style>
    input[type="file"].form-control {
      position: relative !important;
      opacity: 1 !important;
      z-index: auto !important;
      height: auto !important;
      font-size: 14px !important;
        padding: 6px 12px !important;
        height: auto !important;
        line-height: normal !important;
    }
    </style>  
<h5 class="mb-4 fw-light">
  <a class="text-reset" href="{{ url('panel/admin') }}">{{ __('admin.dashboard') }}</a>
  <i class="bi-chevron-right me-1 fs-6"></i>
  <span class="text-muted">Committee Member ({{ $data->count() }})</span>

  <a href="#" data-bs-toggle="modal" data-bs-target="#addNew" class="btn btn-sm btn-dark float-lg-end mt-1 mt-lg-0">
    <i class="bi-plus-lg"></i> {{ trans('misc.add_new') }}
  </a>
</h5>

<div class="content">
  <div class="row">
    <div class="col-lg-12">

      {{-- Success message --}}
      @if (session('success_message'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="bi bi-check2 me-1"></i> {{ session('success_message') }}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      @endif

      {{-- Errors --}}
      @include('errors.errors-forms')

      <div class="card shadow-custom border-0">
        <div class="card-body p-lg-4">
          <div class="table-responsive p-0">
            <table class="table table-hover align-middle">
              <thead>
                <tr>
                  <th>#ID</th>
                  <th><i class="bi bi-megaphone-fill me-2"></i>Title</th>
                  <th>Date</th>
                  <th>File</th>
                  <th>Status</th>
                  <th>{{ trans('admin.actions') }}</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($data as $notice)
                  <tr>
                    <td>{{ $notice->id }}</td>
                    <td>{{ $notice->title }}</td>
                    <td>{{ \Carbon\Carbon::parse($notice->date)->format('d M, Y') }}</td>
                    <td>
                      @if($notice->file)
                        <a href="{{ asset('public/commitee-members/'.$notice->file) }}" target="_blank" class="text-danger fw-semibold">
                          <i class="fas fa-file-pdf me-1"></i> View
                        </a>
                      @else
                        <span class="text-muted">No file</span>
                      @endif
                    </td>
                    <td>
                      @if ($notice->status)
                        <span class="badge bg-success">Active</span>
                      @else
                        <span class="badge bg-secondary">Inactive</span>
                      @endif
                    </td>
                    <td>
                      {{-- Edit --}}
                      <button class="btn btn-sm btn-warning" 
                              data-bs-toggle="modal" 
                              data-bs-target="#editModal{{ $notice->id }}">
                        <i class="bi bi-pencil-square"></i>
                      </button>

                      {{-- Delete --}}
                      <form method="POST" action="{{ url('panel/admin/committee-member/delete', $notice->id) }}" class="d-inline">
                        @csrf
                        <button type="submit" class="btn btn-sm btn-danger"
                          onclick="return confirm('Are you sure you want to delete this notice?')">
                          <i class="bi bi-trash"></i>
                        </button>
                      </form>
                    </td>
                  </tr>

                  {{-- Edit Modal --}}
                  <div class="modal fade" id="editModal{{ $notice->id }}" tabindex="-1" aria-labelledby="editLabel{{ $notice->id }}" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="editLabel{{ $notice->id }}">Edit Committee Member</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST" action="{{ url('panel/admin/committee-member/update', $notice->id) }}" enctype="multipart/form-data">
                          @csrf
                          <div class="modal-body">
                            <div class="mb-3">
                              <label class="form-label">Title</label>
                              <input type="text" name="title" class="form-control" value="{{ $notice->title }}" required>
                            </div>
                            <div class="mb-3">
                              <label class="form-label">Date</label>
                              <input type="date" name="date" class="form-control" value="{{ $notice->date }}" required>
                            </div>
                            <div class="mb-3">
                              <label class="form-label">Upload New File (optional)</label>
                              <input type="file" name="file" accept="application/pdf" class="form-control">
                            </div>
                            <div class="mb-3">
                              <label class="form-label">Status</label>
                              <select name="status" class="form-select">
                                <option value="1" {{ $notice->status ? 'selected' : '' }}>Active</option>
                                <option value="0" {{ !$notice->status ? 'selected' : '' }}>Inactive</option>
                              </select>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Save Changes</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>

                @empty
                  <tr>
                    <td colspan="6" class="text-center text-muted py-5">No Committee Member found</td>
                  </tr>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>

    </div><!-- col -->
  </div><!-- row -->
</div><!-- content -->

{{-- Add Modal --}}
<div class="modal fade" id="addNew" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addLabel"><strong>Add New Committee Member</strong></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form method="POST" action="{{ url('panel/admin/committee-member/add') }}" enctype="multipart/form-data">
        @csrf
        <div class="modal-body">
          <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" name="title" class="form-control" placeholder="Enter notice title" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Date</label>
            <input type="date" name="date" class="form-control" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Upload File</label>
            <input type="file" name="file" class="form-control " required>
          </div>
          <div class="mb-3">
            <label class="form-label">Status</label>
            <select name="status" class="form-select">
              <option value="1" selected>Active</option>
              <option value="0">Inactive</option>
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
@endsection
