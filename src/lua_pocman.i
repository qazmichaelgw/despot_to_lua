%module lua_pocman
%include "std_string.i"
%include "std_vector.i"

%inline %{
    #include "pocman.h"
    #include "include/despot/simple_tui.h"
    using namespace despot;
%}


%include "pocman.h"
%include "include/despot/simple_tui.h"
