if(other.visible)
{
	if(lastHitFrame != Time.frameCount) //can only be hit once per frame
	{
		if((lastHit != other) or (Time.time >= (lastHitTime + 0.1)))
		{
			PlayerHit(2 * Time.deltaTime);
			
			lastHit = other;
			lastHitFrame = Time.frameCount;
			lastHitTime  = Time.time;
		}
	}
}