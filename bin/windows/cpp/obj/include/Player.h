#ifndef INCLUDED_Player
#define INCLUDED_Player

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <openfl/_v2/display/Sprite.h>
HX_DECLARE_CLASS0(Player)
HX_DECLARE_CLASS3(openfl,_v2,display,DisplayObject)
HX_DECLARE_CLASS3(openfl,_v2,display,DisplayObjectContainer)
HX_DECLARE_CLASS3(openfl,_v2,display,IBitmapDrawable)
HX_DECLARE_CLASS3(openfl,_v2,display,InteractiveObject)
HX_DECLARE_CLASS3(openfl,_v2,display,Sprite)
HX_DECLARE_CLASS3(openfl,_v2,events,Event)
HX_DECLARE_CLASS3(openfl,_v2,events,EventDispatcher)
HX_DECLARE_CLASS3(openfl,_v2,events,IEventDispatcher)


class HXCPP_CLASS_ATTRIBUTES  Player_obj : public ::openfl::_v2::display::Sprite_obj{
	public:
		typedef ::openfl::_v2::display::Sprite_obj super;
		typedef Player_obj OBJ_;
		Player_obj();
		Void __construct();

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< Player_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Player_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("Player"); }

		Float xSpeed;
		Float ySpeed;
		Float maxXSpeed;
		Float maxYSpeed;
		int i;
		Float gravity;
		bool isJumping;
		virtual Void update( ::openfl::_v2::events::Event e);
		Dynamic update_dyn();

		Float moveViewX;
		Float moveViewY;
		virtual Void moveView( );
		Dynamic moveView_dyn();

		bool againstWall;
		int wallBlock;
		virtual Void move( );
		Dynamic move_dyn();

		virtual Void startJumping( );
		Dynamic startJumping_dyn();

		bool onTheGround;
		int groundBlock;
		bool againstTheCeiling;
		int ceilingBlock;
		virtual Void jumpController( );
		Dynamic jumpController_dyn();

};


#endif /* INCLUDED_Player */ 
