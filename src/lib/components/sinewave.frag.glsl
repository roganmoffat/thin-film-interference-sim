precision mediump float;

varying vec2 vUv;
uniform float uTime;

void main() {
	float distanceFromCenter = vUv.y - 0.5;
	float wave = sin(vUv.x * 20.0) * 0.4; // ADD -uTime to animate
    distanceFromCenter += wave;
	if (abs(distanceFromCenter) > 0.01) {
		gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
	} else {
		gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
	}
}