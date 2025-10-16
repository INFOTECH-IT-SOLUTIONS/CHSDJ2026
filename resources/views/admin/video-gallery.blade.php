@extends('admin.layout')

@section('content')
<style>
  .video-thumbnail {
    width: 120px;
    height: 70px;
    object-fit: cover;
    border-radius: 8px;
    cursor: pointer;
    transition: transform 0.2s;
  }
  .video-thumbnail:hover {
    transform: scale(1.05);
  }
</style>

<h5 class="mb-4 fw-light">
  <a class="text-reset" href="{{ url('panel/admin') }}">{{ __('admin.dashboard') }}</a>
  <i class="bi-chevron-right me-1 fs-6"></i>
  <span class="text-muted">
    <i class="bi bi-camera-video-fill me-2"></i>Video Gallery ({{ $data->count() }})
  </span>

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
                  <th><i class="bi bi-camera-video-fill me-2"></i>Title</th>
                  <th>Preview</th>
                  <th>Video Link</th>
                  <th>Status</th>
                  <th>Date</th>
                  <th>{{ trans('admin.actions') }}</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($data as $video)
                  @php
                    // Extract YouTube Video ID
                    preg_match('/(youtu\.be\/|v=)([a-zA-Z0-9_-]+)/', $video->video_link, $matches);
                    $videoId = $matches[2] ?? null;
                  @endphp

                  <tr>
                    <td>{{ $video->id }}</td>
                    <td>{{ $video->title }}</td>
                    <td>
                      @if($videoId)
                        <img src="https://img.youtube.com/vi/{{ $videoId }}/mqdefault.jpg"
                             class="video-thumbnail"
                             data-video="https://www.youtube.com/embed/{{ $videoId }}?autoplay=1"
                             alt="Video Thumbnail">
                      @else
                        <span class="text-muted">Invalid Link</span>
                      @endif
                    </td>
                    <td>
                      <a href="{{ $video->video_link }}" target="_blank" class="text-primary fw-semibold">
                        <i class="bi bi-link-45deg"></i> Open
                      </a>
                    </td>
                    <td>
                      @if ($video->status)
                        <span class="badge bg-success">Active</span>
                      @else
                        <span class="badge bg-secondary">Inactive</span>
                      @endif
                    </td>
                    <td>{{ \Carbon\Carbon::parse($video->created_at)->format('d M, Y') }}</td>
                    <td>
                      {{-- Edit --}}
                      <button class="btn btn-sm btn-warning" 
                              data-bs-toggle="modal" 
                              data-bs-target="#editModal{{ $video->id }}">
                        <i class="bi bi-pencil-square"></i>
                      </button>

                      {{-- Delete --}}
                      <form method="POST" action="{{ url('panel/admin/video-gallery/delete', $video->id) }}" class="d-inline">
                        @csrf
                        <button type="submit" class="btn btn-sm btn-danger"
                          onclick="return confirm('Are you sure you want to delete this video?')">
                          <i class="bi bi-trash"></i>
                        </button>
                      </form>
                    </td>
                  </tr>

                  {{-- Edit Modal --}}
                  <div class="modal fade" id="editModal{{ $video->id }}" tabindex="-1" aria-labelledby="editLabel{{ $video->id }}" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="editLabel{{ $video->id }}">Edit Video</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST" action="{{ url('panel/admin/video-gallery/update', $video->id) }}">
                          @csrf
                          <div class="modal-body">
                            <div class="mb-3">
                              <label class="form-label">Title</label>
                              <input type="text" name="title" class="form-control" value="{{ $video->title }}" required>
                            </div>
                            <div class="mb-3">
                              <label class="form-label">Video Link</label>
                              <input type="url" name="video_link" class="form-control" value="{{ $video->video_link }}" required>
                              <small class="text-muted">Example: https://www.youtube.com/watch?v=abcd1234</small>
                            </div>
                            <div class="mb-3">
                              <label class="form-label">Status</label>
                              <select name="status" class="form-select">
                                <option value="1" {{ $video->status ? 'selected' : '' }}>Active</option>
                                <option value="0" {{ !$video->status ? 'selected' : '' }}>Inactive</option>
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
                    <td colspan="7" class="text-center text-muted py-5">No videos found</td>
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
        <h5 class="modal-title" id="addLabel"><strong>Add New Video</strong></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form method="POST" action="{{ url('panel/admin/video-gallery/add') }}">
        @csrf
        <div class="modal-body">
          <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" name="title" class="form-control" placeholder="Enter video title" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Video Link (YouTube URL)</label>
            <input type="url" name="video_link" class="form-control" placeholder="https://www.youtube.com/watch?v=..." required>
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

{{-- Video Popup --}}
<div class="modal fade" id="videoModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content bg-dark border-0">
      <div class="modal-body p-0 position-relative">
        <button type="button" class="btn-close btn-close-white position-absolute top-0 end-0 m-3" data-bs-dismiss="modal"></button>
        <div class="ratio ratio-16x9">
          <iframe id="videoFrame" src="" allowfullscreen allow="autoplay"></iframe>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  const videoModal = document.getElementById('videoModal');
  const videoFrame = document.getElementById('videoFrame');

  document.querySelectorAll('.video-thumbnail').forEach(el => {
    el.addEventListener('click', () => {
      const videoUrl = el.dataset.video;
      videoFrame.src = videoUrl;
      new bootstrap.Modal(videoModal).show();
    });
  });

  videoModal.addEventListener('hidden.bs.modal', () => {
    videoFrame.src = '';
  });
</script>
@endsection
