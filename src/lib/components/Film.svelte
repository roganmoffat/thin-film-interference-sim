<script>
    // @ts-ignore
    import { T } from '@threlte/core';
    let { color, position, rotation } = $props();
</script>

<T.Mesh {position} {rotation}>
  <T.BoxGeometry args={[2, 1, 4]} />
  <T.MeshStandardMaterial color={color} roughness={0.3} />
</T.Mesh>
