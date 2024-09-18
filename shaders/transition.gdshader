shader_type canvas_item;
render_mode unshaded;
uniform float cutoff : hint_range(0.0, 1.0);
uniform float smooth_size : hint_range(0.0, 1.0);
uniform float scale = 2.0;
const float pivot = 0.5;
uniform sampler2D mask : hint_normal;
uniform bool use_adjust_aspect_ratio;

void fragment() {
	float value = 0.0;
	if (use_adjust_aspect_ratio) {
		vec2 ps = SCREEN_PIXEL_SIZE;
		vec2 ratio = (ps.x > ps.y) ? vec2(ps.y / ps.x, 1) : vec2(1, ps.x / ps.y);
		vec4 a = texture(mask, (UV - pivot) * scale * ratio + pivot);
		value = a.r;
	}
	else {
		value = texture(mask, UV).r;
	}
	float alpha = smoothstep(cutoff, cutoff + smooth_size, value * (1.0 - smooth_size) + smooth_size);
	COLOR = vec4(COLOR.rgb, alpha);
}