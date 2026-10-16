<script>
  import { T } from '@threlte/core';
  import { OrbitControls } from '@threlte/extras';
  import OutlineBox from '#lib/components/OutlineBox.svelte';
  import Wave from '#lib/components/Wave.svelte';

  let { n_outside, n_film, n_inside, thickness, wavelength, m_value } = $props();
  let scale_constant = 100.0;

  // Explicitly derive the size so Svelte 5 registers reactivity across component boundaries
</script>

<T.PerspectiveCamera makeDefault position={[5, 5, 5]} fov={50}>
  <OrbitControls enableDamping />
</T.PerspectiveCamera>

<T.DirectionalLight position={[3, 10, 7]} intensity={1.5} />
<T.AmbientLight intensity={0.3} />

<!-- Outline of the inside medium -->
<OutlineBox 
  color="red" 
  position={[(thickness / scale_constant)/2 + 1, 0, 0]} 
  rotation={[0, Math.PI, 0]} 
  size={[2, 1, 4.25]} 
  title={'Inside Medium \nn_inside: ' + n_inside}
  fade={true}
/>

<!-- Outline of the thin film -->
<OutlineBox 
  color="blue" 
  position={[0, 0, 0]} 
  rotation={[0, Math.PI, 0]} 
  size={[thickness / scale_constant, 1, 4]} 
  title={`Thin Film: ${thickness} nm \nn_film: ${n_film} \nm: ${m_value}`}
  fade={false}
/>

<!-- Outline of the outside medium -->
<OutlineBox 
  color="red" 
  position={[-(thickness / scale_constant)/2 - 1, 0, 0]} 
  rotation={[0, 0, 0]} 
  size={[2, 1, 4.25]} 
  title={'Outside Medium \nn_outside: ' + n_outside}
  fade={true}
/>

<Wave thickness={thickness} wavelength={wavelength}></Wave>
