<%@ page contentType="text/html; charset=UTF-8"%>

<style>

/* Button */

	input[type="button"],
	input[type="submit"],
	input[type="reset"],
	.button,
	button {
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		-moz-transition: background-color 0.2s ease-in-out;
		-webkit-transition: background-color 0.2s ease-in-out;
		-ms-transition: background-color 0.2s ease-in-out;
		transition: background-color 0.2s ease-in-out;
		background-color: #98c593;
		border: 0;
		border-radius: 3.5em;
		color: #ffffff;
		cursor: pointer;
		display: inline-block;
		height: 3.5em;
		line-height: 3.5em;
		outline: 0;
		padding: 0 2em 0 2em;
		position: relative;
		text-align: center;
		text-decoration: none;
	}

</style>

<article class="page">
	<header class="full-layout">
		<hgroup class="whole">
			<h1>Error</h1>
		</hgroup>
	</header>

	<div class="full-layout">
		<div class="whole">
			<div class="wrapper">
				<h2>${exception.message}</h2>
			</div>
			<p>
			<button onClick="goMain()">확인</button>
		</div>
	</div>
</article>

<script>
function goMain() {
	location.href="/";
}
</script>