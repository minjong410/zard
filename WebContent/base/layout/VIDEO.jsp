<div class="wrapper">
	<div class="side-layout">
		<figure class="videoLayout">
			<video class="video-player" src="/base/movie/${result.cityId}.mp4" width="100%" preload="auto" controls>
				<source src="/base/movie/${result.cityId}.mp4" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'>
				<p>Sorry, but your browser does not support this video format.</p>
			</video>
			<button class="video-play" aria-label="Play Video"></button>
			<figcaption>
				<div class="inner">${result.memo}</div>
			</figcaption>
		</figure>
	</div>
</div>