#version 150

in vec4 vertexColor;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
    vec4 color = vertexColor;
    if (color.a == 0.0) {
        discard;
    }
	
	// Change Mojang loading background to the CubeCraft color scheme
	if (color.r == 239.0/255.0 && color.g == 50.0/255.0 && color.b == 61.0/255.0) {
		color = vec4(58.0/255.0, 169.0/255.0, 255.0/255.0, color.a);
	}

    fragColor = color * ColorModulator;
}
