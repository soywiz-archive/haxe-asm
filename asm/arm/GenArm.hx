package asm.arm;
import haxe.io.Output;

/**
 * ...
 * @author soywiz
 */
class GenArm {
	private var output:Output;

	public function new(output:Output)  {
		this.output = output;
	}
	
	function adc(dst:Register, src1:Register, src2:Operand, s:SBit, cond:Condition) {
		addrmod1(cond | ADC | s, src1, dst, src2);
	}
}

// Based on: https://code.google.com/p/v8/source/browse/trunk/src/arm
abstract Register(Int) {
	var r0 = 0; var r1 = 1; var r2 = 2; var r3 = 3;
	var r4 = 4; var r5 = 5; var r6 = 6; var r7 = 7;
	var r8 = 8; var r9 = 9; var r10 = 10; var fp = 11;
	var ip = 12; var sp = 13; var lr = 14; var pc = 15;
}

abstract Opcode(Int) {
  var AND =  0 << 21;  // Logical AND.
  var EOR =  1 << 21;  // Logical Exclusive OR.
  var SUB =  2 << 21;  // Subtract.
  var RSB =  3 << 21;  // Reverse Subtract.
  var ADD =  4 << 21;  // Add.
  var ADC =  5 << 21;  // Add with Carry.
  var SBC =  6 << 21;  // Subtract with Carry.
  var RSC =  7 << 21;  // Reverse Subtract with Carry.
  var TST =  8 << 21;  // Test.
  var TEQ =  9 << 21;  // Test Equivalence.
  var CMP = 10 << 21;  // Compare.
  var CMN = 11 << 21;  // Compare Negated.
  var ORR = 12 << 21;  // Logical (inclusive) OR.
  var MOV = 13 << 21;  // Move.
  var BIC = 14 << 21;  // Bit Clear.
  var MVN = 15 << 21;  // Move Not.
}

abstract Condition(Int) {
  var eq =  0 << 28;                 // Z set            Equal.
  var ne =  1 << 28;                 // Z clear          Not equal.
  var cs =  2 << 28;                 // C set            Unsigned higher or same.
  var cc =  3 << 28;                 // C clear          Unsigned lower.
  var mi =  4 << 28;                 // N set            Negative.
  var pl =  5 << 28;                 // N clear          Positive or zero.
  var vs =  6 << 28;                 // V set            Overflow.
  var vc =  7 << 28;                 // V clear          No overflow.
  var hi =  8 << 28;                 // C set, Z clear   Unsigned higher.
  var ls =  9 << 28;                 // C clear or Z set Unsigned lower or same.
  var ge = 10 << 28;                 // N == V           Greater or equal.
  var lt = 11 << 28;                 // N != V           Less than.
  var gt = 12 << 28;                 // Z clear, N == V  Greater than.
  var le = 13 << 28;                 // Z set or N != V  Less then or equal
  var al = 14 << 28;                 //                  Always.
  
  var kSpecialCondition = 15 << 28;  // Special condition (refer to section A3.2.1).
  var kNumberOfConditions = 16;
  
  // Aliases.
  var hs = cs;                       // C set            Unsigned higher or same.
  var lo = cc;                       // C clear          Unsigned lower.
}

// Condition code updating mode.
abstract SBit(Int) {
  var SetCC   = 1 << 20;  // Set condition code.
  var LeaveCC = 0 << 20;  // Leave condition code unchanged.
}