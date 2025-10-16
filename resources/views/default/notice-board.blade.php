@extends('app')

@section('title') Notice Board - @endsection

@section('css')
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<style>
    table.committee-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .committee-table th,
    .committee-table td {
        padding: 14px 18px;
        border-bottom: 1px solid #ddd;
        text-align: left;
        vertical-align: middle;
    }

    .committee-table th {
        background-color: #f8f9fa;
        color: #333;
        font-weight: 600;
    }

    .committee-table tbody tr:hover {
        background-color: #f9f9f9;
    }

    /* Modal styles */
    .modal-pdf {
        display: none;
        position: fixed;
        z-index: 1050;
        padding-top: 60px;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.8);
    }

    .modal-content-pdf {
        margin: auto;
        background: #fff;
        width: 90%;
        max-width: 900px;
        height: 80vh;
        border-radius: 10px;
        position: relative;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
    }

    .modal-content-pdf iframe {
        width: 100%;
        height: 100%;
        border: none;
        border-radius: 10px;
    }

    .close-modal {
        position: absolute;
        top: 10px;
        right: 15px;
        color: #fff;
        font-size: 32px;
        font-weight: bold;
        cursor: pointer;
        z-index: 10;
        transition: 0.3s;
    }

    .close-modal:hover {
        color: #ff4b5c;
        transform: scale(1.2);
    }

    /* Stylish PDF icon button */
    .pdf-viewer-btn {
        text-decoration: none;
        display: inline-block;
    }

    .pdf-icon {
        background: linear-gradient(135deg, #ff416c, #ff4b2b);
        color: #fff;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        box-shadow: 0 5px 15px rgba(255, 75, 43, 0.4);
        transition: all 0.3s ease;
        font-weight: bold;
    }

    .pdf-icon i {
        font-size: 26px;
    }

    .pdf-icon span {
        font-size: 11px;
        margin-top: 2px;
        font-weight: 600;
    }

    .pdf-viewer-btn:hover .pdf-icon {
        transform: translateY(-6px) scale(1.1);
        box-shadow: 0 8px 25px rgba(255, 75, 43, 0.6);
    }
</style>
@endsection

@section('content')
<div class="py-5 bg-primary bg-sections">
    <div class="btn-block text-center text-white position-relative">
        <h1>Notice Board</h1>
        <p>{{ $settings->title }}</p>
    </div>
</div>

<div class="py-5 bg-white">
    <div class="container">
        @if ($data->count() > 0)
        <div class="table-responsive">
            <table class="table committee-table align-middle">
                <thead>
                    <tr>
                        <th>#SL</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th style="text-align: center">View</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $index => $member)
                    <tr>
                        <td>{{ $index + 1 }}</td>
                        <td>{{ $member->title }}</td>
                        <td>{{ \Carbon\Carbon::parse($member->date)->format('d M, Y') }}</td>
                        <td style="text-align: center">
                            @if ($member->file)
                            <a href="javascript:void(0)" class="pdf-viewer-btn view-btn"
                                data-pdf="{{ asset('public/notice/'.$member->file) }}" title="View PDF">
                                <div class="pdf-icon">
                                    <i class="fa fa-file-pdf"></i>
                                </div>
                            </a>
                            @else
                            <span class="text-muted">No File</span>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        @else
        <div class="btn-block text-center">
            <i class="far fa-times-circle display-4 text-muted"></i>
        </div>
        <h3 class="btn-block text-center my-3">
            {{ trans('misc.no_results_found') }}
        </h3>
        @endif
    </div>
</div>

{{-- Modal for PDF Viewer --}}
<div id="pdfModal" class="modal-pdf">
    <span class="close-modal">&times;</span>
    <div class="modal-content-pdf">
        <iframe src="" id="pdfFrame"></iframe>
    </div>
</div>
@endsection

@section('javascript')
<script>
    document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('pdfModal');
    const iframe = document.getElementById('pdfFrame');
    const closeBtn = modal.querySelector('.close-modal');

    document.querySelectorAll('.view-btn').forEach(icon => {
        icon.addEventListener('click', function() {
            const pdfUrl = this.getAttribute('data-pdf');
            iframe.src = pdfUrl;
            modal.style.display = 'block';
        });
    });

    closeBtn.onclick = function() {
        modal.style.display = 'none';
        iframe.src = ''; // Reset PDF
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
            iframe.src = '';
        }
    }
});
</script>
@endsection