varying vec3 vPosition;
uniform vec3 uColor;

void main() {
    // 1. Normalize X from [-0.5, 0.5] to [0.0, 1.0]
    float t = clamp((vPosition.x + 0.5) / 1.0, 0.0, 1.0);

    // 2. Shape with an exponent
    float fade = 0.1 * pow(t, 3.0); 

    // 3. Apply the fade to the color
    gl_FragColor = vec4(uColor, fade);
}