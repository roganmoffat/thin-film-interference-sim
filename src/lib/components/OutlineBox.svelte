<script lang="ts">
	import vertexShader from './fade.vert.glsl?raw';
	import fragmentShader from './fade.frag.glsl?raw';
	import fragmentOutlineShader from './fadeOutline.frag.glsl?raw';
	import { T } from '@threlte/core';
	import { Text } from '@threlte/extras';
	import { FrontSide, BoxGeometry, Color } from 'three';

	let { color, position, rotation, size, title, fade } = $props<{
		color?: string;
		position?: [number, number, number];
		rotation?: [number, number, number];
		size?: [number, number, number];
		title?: string;
		fade?: boolean;
	}>();
</script>

<T.Group {position} {rotation} scale={size}>
	<!-- Cube Mesh -->
	<T.Mesh>
		<T.BoxGeometry args={[1, 1, 1]} />
		{#if fade}
			<T.ShaderMaterial
				{vertexShader}
				{fragmentShader}
				uniforms={{ uColor: { value: new Color(color ?? '#ffffff') } }}
				transparent
				depthTest={false}
				depthWrite={false}
			/>
		{:else}
			<T.MeshStandardMaterial
				{color}
				roughness={0.3}
				transparent
				opacity={0.05}
				side={FrontSide}
				depthWrite={false}
			/>
		{/if}
	</T.Mesh>

	<!-- Outline Mesh scaled together with the group -->
	<T.LineSegments renderOrder={1}>
		<T.EdgesGeometry args={[new BoxGeometry(1, 1, 1)]} />
		<T.LineBasicMaterial color="#ffffff" linewidth={1} depthTest={false} depthWrite={false} />

		{#if fade}
			<T.ShaderMaterial
				{vertexShader}
				fragmentShader={fragmentOutlineShader}
				uniforms={{ uColor: { value: new Color(color) } }}
				transparent
				depthTest={false}
				depthWrite={false}
			/>
		{/if}
	</T.LineSegments>
</T.Group>

<Text
	text={title}
	position={[
		(position?.[0] ?? 0) - size[0] / 2,
		(position?.[1] ?? 0) - size[1] / 2,
		(position?.[2] ?? 0) + size[2] / 2
	]}
	scale={[1, 1, 1]}
	whiteSpace="normal"
/>

