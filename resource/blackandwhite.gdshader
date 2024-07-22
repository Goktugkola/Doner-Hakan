shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
void fragment() {

    COLOR = texture(SCREEN_TEXTURE, SCREEN_UV);

    // Convert the color to grayscale
    float luminance = dot(COLOR.rgb, vec3(0.2126, 0.7152, 0.0722));

    // Adjust the contrast (increase or decrease the contrast factor)
    float contrastFactor = 1.1; // Adjust this value to control the contrast
    luminance = (luminance - 0.5) * contrastFactor + 0.5;

    COLOR.rgb = vec3(luminance, luminance, luminance);
}
