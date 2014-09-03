package asm;

/**
 * ...
 * @author soywiz
 */
class Function
{
	private var locals:Array<Local> = [];

	public function new() 
	{
		
	}
	
	public function createLocal<T>(type:Class<T>) {
		var local = new Local<T>(type);
		locals.push(local);
		return local;
	}
}

enum Stm {
	Expr;
}

enum Expr {
	
}