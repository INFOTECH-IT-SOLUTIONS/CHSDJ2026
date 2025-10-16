@extends('app')

@section('title') {{ trans('misc.gallery') }} - @endsection
@section('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/glightbox/dist/css/glightbox.min.css">
@endsection
@section('content')
<div class="py-5 bg-primary bg-sections">
  <div class="btn-block text-center text-white position-relative">
    <h1>Video Gallery</h1>
    <p>{{ $settings->title }}</p>
  </div>
</div>

<div class="py-5 bg-white">
  <div class="container">
    <div class="row">
        @if ($video->count() != 0)
        @foreach ($video as $item)
          <div class="col-md-4 mb-4">
            <div class="card shadow-sm border-0">
              @php
                // Extract YouTube video ID
                preg_match('/(?:youtu\.be\/|youtube\.com\/(?:watch\?v=|embed\/|v\/|shorts\/))([\w-]{11})/', $item->video_link, $matches);
                $videoId = $matches[1] ?? null;
              @endphp
      
      @if ($videoId)
      {{-- Thumbnail --}}
      <a href="https://www.youtube.com/embed/{{ $videoId }}?autoplay=1" 
         class="glightbox"
         data-gallery="video-gallery"
         data-type="video"
         data-source="youtube"
         data-title="{{ $item->title }}">
        <img src="https://img.youtube.com/vi/{{ $videoId }}/hqdefault.jpg" 
             class="img-fluid rounded w-100" 
             alt="{{ $item->title }}">
        <div class="position-absolute top-50 start-50 translate-middle text-white fs-2">
          <i class="fas fa-play-circle"></i>
        </div>
      </a>
    @else
      <div class="text-center p-3 text-muted">Invalid YouTube link</div>
    @endif
    
      
              <div class="card-body text-center">
                <h6 class="card-title mb-0">{{ $item->title }}</h6>
              </div>
            </div>
          </div>
        @endforeach
      @else
        <div class="btn-block text-center">
          <i class="far fa-times-circle display-4"></i>
        </div>
        <h3 class="btn-block text-center my-3">
          {{ trans('misc.no_results_found') }}
        </h3>
      @endif
    </div>
  </div>
</div>
@endsection
@section('javascript')
<script src="https://cdn.jsdelivr.net/npm/glightbox/dist/js/glightbox.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const lightbox = GLightbox({
        selector: '.glightbox',
        touchNavigation: true,
        autoplayVideos: true,
        openEffect: 'zoom',
        closeEffect: 'fade',
        plyr: {
            config: {
                ratio: '16:9',
                fullscreen: { enabled: true, fallback: true, iosNative: true },
                youtube: { autoplay: 1, modestbranding: 1, rel: 0 }
            }
        }
    });
});
</script>
@endsection

