<script lang="ts">
	import { T, useTask } from '@threlte/core';
	import { DoubleSide } from 'three';
	import vertexShader from './sinewave.vert.glsl?raw';
	import fragmentShader from './sinewave.frag.glsl?raw';

	let { thickness = 1, wavelength = 1 } = $props<{
		thickness?: number;
		wavelength?: number;
	}>();

	// Initial wave size and angle.
	const oppositeLength = 0.5;
	let thicknessScale = $derived(thickness / 100);
	let waveSize = $derived(4 * Math.sqrt(thicknessScale ** 2 + oppositeLength ** 2));
	let waveTheta = $derived(Math.atan2(oppositeLength, thicknessScale));
	let outsideToFilmWaveSize = $derived(waveSize / 4);

	const uniforms = {
		uTime: { value: 0 }
	};

	useTask((delta) => {
		uniforms.uTime.value += delta;
	});
</script>

<!-- INITIAL WAVE -->
<T.Mesh position={[0, 0, 0]} rotation={[0, waveTheta, 0]}>
	<T.PlaneGeometry args={[waveSize, 1]} />
	<T.ShaderMaterial
		{vertexShader}
		{fragmentShader}
		{uniforms}
		transparent
		depthTest={false}
		depthWrite={false}
		side={DoubleSide}
	/>
</T.Mesh>

<!-- Outside to film reflection -->
<!-- <T.Mesh position={[-thickness / 100, 0, 0]} rotation={[0, -waveTheta, 0]}>
	<T.PlaneGeometry args={[outsideToFilmWaveSize, 1]} />
	<T.MeshBasicMaterial color="blue" transparent={true} opacity={0.5} side={DoubleSide} />
</T.Mesh> -->

<!-- FIlm to inside reflection -->
<!-- <T.Mesh position={[0, 0, -4.25/8]} rotation={[0, -waveTheta, 0]}>
	<T.PlaneGeometry args={[outsideToFilmWaveSize, 1]} />
	<T.MeshBasicMaterial color="blue" transparent={true} opacity={0.5} side={DoubleSide} />
</T.Mesh> -->
