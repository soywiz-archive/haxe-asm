package asm;

/**
 * ...
 * @author soywiz
 */
class Local<T>
{
	private var type:Class<T>;
	
	public function new(type:Class<T>) 
	{
		this.type = type;
	}
}