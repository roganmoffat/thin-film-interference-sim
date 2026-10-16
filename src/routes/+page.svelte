<script>
	// @ts-ignore
	import { Canvas } from '@threlte/core';
	import Scene from '#lib/Scene.svelte';

	let n_outside = $state(1.0);
	let n_film = $state(1.5);
	let n_inside = $state(1.0);
	let thickness = $state(100);
	let wavelength = $state(550);
	let m_value = $state(1);
</script>

<main style="width: 100vw; height: 100vh; margin: 0; overflow: hidden; background: #111;">
	<div
		style="position: absolute; top: 0; left: 0; width: 100%; text-align: center; color: white; z-index: 1;"
	>
		<h1>Thin Film Simulation</h1>
	</div>
	<!-- side panel -->
	<div
		style="position: absolute; top: 0; right: 0; width: 300px; height: 100%; background: rgba(0, 0, 0, 0.5); color: white; z-index: 1; padding: 20px;"
	>
		<h2>Parameters</h2>
		<label for="n_outside">n_outside:</label>
		<input type="number" id="n_outside" bind:value={n_outside} step="0.01" min="1" max="3" />
		<br />
		<label for="n_film">n_film:</label>
		<input type="number" id="n_film" bind:value={n_film} step="0.01" min="1" max="3" />
		<br />
		<label for="n_inside">n_inside:</label>
		<input type="number" id="n_inside" bind:value={n_inside} step="0.01" min="1" max="3" />
		<br />
		<label for="thickness">thickness (nm):</label>
		<input type="number" id="thickness" bind:value={thickness} step="1" min="1" max="1000" />
		<br />
		<label for="wavelength">wavelength (nm):</label>
		<input type="number" id="wavelength" bind:value={wavelength} step="1" min="380" max="750" />
		<br />
		<label for="m_value">m_value:</label>
		<input type="number" id="m_value" bind:value={m_value} step="1" min="-10" max="10" />
	</div>
	<Canvas>
		<Scene {n_outside} {n_film} {n_inside} {thickness} {wavelength} {m_value} />
	</Canvas>
</main>
