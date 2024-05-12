shader_type canvas_item;
uniform vec3 colors[16]: source_color;
uniform float epsilon = 0.5;
void fragment() {
	vec4 c = texture(TEXTURE, UV);
	float[15] dist;
	dist[0] = distance(colors[0], c.rgb);
	dist[1] = distance(colors[1], c.rgb);
	dist[2] = distance(colors[2], c.rgb);
	dist[3] = distance(colors[3], c.rgb);
	dist[4] = distance(colors[4], c.rgb);
	dist[5] = distance(colors[5], c.rgb);
	dist[6] = distance(colors[6], c.rgb);
	dist[7] = distance(colors[7], c.rgb);
	dist[8] = distance(colors[8], c.rgb);
	dist[9] = distance(colors[9], c.rgb);
	dist[10] = distance(colors[10], c.rgb);
	dist[11] = distance(colors[11], c.rgb);
	dist[12] = distance(colors[12], c.rgb);
	dist[13] = distance(colors[13], c.rgb);
	dist[14] = distance(colors[14], c.rgb);
	
	COLOR.rgb = dist[0] < epsilon ? colors[0]:
		(dist[1] < epsilon ? colors[1]:
		(dist[2] < epsilon ? colors[2]:
		(dist[3] < epsilon ? colors[3]:
		(dist[4] < epsilon ? colors[4]:
		(dist[5] < epsilon ? colors[5]:
		(dist[6] < epsilon ? colors[6]:
		(dist[7] < epsilon ? colors[7]:
		(dist[8] < epsilon ? colors[8]:
		(dist[9] < epsilon ? colors[9]:
		(dist[10] < epsilon ? colors[10]:
		(dist[11] < epsilon ? colors[11]:
		(dist[12] < epsilon ? colors[12]:
		(dist[13] < epsilon ? colors[13]:
		(dist[14] < epsilon ? colors[14]:
		colors[15]))))))))))))));
	COLOR.a = 1.0;
}