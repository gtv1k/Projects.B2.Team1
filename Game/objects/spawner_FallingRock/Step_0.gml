isVisibleThisFrame = visible;

//Debug.Log("Visible = ", isVisibleThisFrame);

if(isVisibleThisFrame and wasInvisibleLastFrame)
{
	instance = instance_create_layer(x, y, /*layer_id*/ "Attacks", /*obj*/ obj_Particle_FallingRock);

	//Debug.Log("pos = (", x, ", ", y, ")");
}

wasInvisibleLastFrame = !isVisibleThisFrame;