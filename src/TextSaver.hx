package;
import openfl.display.Sprite;

/**
 * ...
 * @author Jesse
 */
class TextSaver extends Sprite
{
	public function new() 
	{
		super();
		//0=question, 1=hint 1, 2=hint 2, 3=hint3, 4 = shortened questions, 5 = answer 1, 6 = answer 2, 7 = answer 3
		Global.cases.push(["Mijn ouders zijn gescheiden en ik woon bij mijn moeder. Ik zie mijn vader eigenlijk nooit, terwijl ik dat wel graag zou willen. Kan ik dat veranderen?", 
						   "Je hebt meestal het recht om je ouders te zien.", 
						   "Je hoeft je ouders niet te zien als je dat echt niet wilt.",  
						   "Je mag jouw ouders niet zien als de rechter denkt dat dat beter voor jou is.",
						   "Kan ik een van mijn ouders zien, ook al woon ik bij de ander?",
						   "A.      Je hebt altijd het recht om jouw ouders te zien.", 
						   "B.      Je kan jouw ouders zien als dit in jouw eigen belang is en je dit ook zelf wilt.",
						   "C.      Je hebt de plicht om je ouders te zien."
						   ][
						   "",
						   "",
						   );
	}
	
}