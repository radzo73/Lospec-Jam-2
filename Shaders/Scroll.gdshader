shader_type canvas_item;

uniform vec2 scroll;
void fragment() {
	COLOR = texture(TEXTURE, UV + (scroll * TIME));
}
