require 'message/M_Dormitory'
require 'message/M_Menu'
require 'message/M_Help'
require 'message/M_Time'

class MessageFactory
    
    include M_Dormitory
    include M_Menu
    include M_Help
    include M_Time
    
end