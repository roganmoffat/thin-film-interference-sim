<script>
	import vertexShader from './fade.vert.glsl?raw';
	import fragmentShader from './fade.frag.glsl?raw';
	import { T } from '@threlte/core';
  import { BoxGeometry, Color } from 'three';

    let { color, position, rotation } = $props();
</script>

<T.Group {position} {rotation}>
  <!-- Cube -->
  <T.Mesh>
    <T.BoxGeometry args={[2, 1, 4]} />
    <T.ShaderMaterial
      {vertexShader}
      {fragmentShader}
      uniforms={{ uColor: { value: new Color(color) } }}
      transparent
    />
  </T.Mesh>

  <!-- Outline -->
  <T.LineSegments>
    <T.EdgesGeometry args={[new BoxGeometry(2, 1, 4)]} />
    <T.ShaderMaterial
      {vertexShader}
      {fragmentShader}
      uniforms={{ uColor: { value: new Color('#ffffff') } }}
      transparent
    />
  </T.LineSegments>
</T.Group>