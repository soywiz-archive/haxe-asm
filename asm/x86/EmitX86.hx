package asm.x86 ;
import haxe.io.Output;

/**
 * ...
 * @author soywiz
 */
class EmitX86 {
	private var output:Output;
	private var bits32:Bool = true;
	
	public function new(output:Output)  {
		this.output = output;
	}
	
	private function write_imm1632(value:Int) {
		if (bits32) {
			output.writeInt32(value);
		} else {
			output.writeInt16(value);
		}
	}
	
	public function addAL(value:Int) { output.writeByte(0x04); output.writeByte(value); }
	public function addEAX(value:Int) { output.writeByte(0x05); write_imm1632(value); }
}

abstract Register(Int) {
	var EAX = 0;
}