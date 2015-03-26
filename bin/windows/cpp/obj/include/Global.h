#ifndef INCLUDED_Global
#define INCLUDED_Global

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Block)
HX_DECLARE_CLASS0(Global)
HX_DECLARE_CLASS0(Level1)
HX_DECLARE_CLASS3(openfl,_v2,display,DisplayObject)
HX_DECLARE_CLASS3(openfl,_v2,display,DisplayObjectContainer)
HX_DECLARE_CLASS3(openfl,_v2,display,IBitmapDrawable)
HX_DECLARE_CLASS3(openfl,_v2,display,InteractiveObject)
HX_DECLARE_CLASS3(openfl,_v2,display,Sprite)
HX_DECLARE_CLASS3(openfl,_v2,events,EventDispatcher)
HX_DECLARE_CLASS3(openfl,_v2,events,IEventDispatcher)


class HXCPP_CLASS_ATTRIBUTES  Global_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef Global_obj OBJ_;
		Global_obj();
		Void __construct();

	public:
		inline void *operator new( size_t inSize, bool inContainer=false)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< Global_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Global_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		::String __ToString() const { return HX_CSTRING("Global"); }

		static bool left;
		static bool right;
		static bool up;
		static bool down;
		static int levelWidth;
		static int levelHeight;
		static ::Level1 level;
		static Array< ::Dynamic > blocks;
};


#endif /* INCLUDED_Global */ 
