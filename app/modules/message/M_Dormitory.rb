require 'saver/DormitoryMenuSaver'
require 'parser/JBNUDormitoryParser'
require 'util/TimeHelper'

module M_Dormitory
    
    def makeMessage_Cham(menu)
        
#         message = ""
            
#         message += menu.week + "\n\n"

#         if menu.breakfast.size == 1
#             message += "아침" + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.breakfast[0].split(":")[1]) + "\n\n"
#         else
#             message += "아침" + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.breakfast[0].split(":")[1]) + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.breakfast[1]) + "\n\n\n"
#         end
        
#         if menu.lunch.size == 1
#             message += "점심" + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.lunch[0].split(":")[1]) + "\n\n"
#         else
#              message += "점심" + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.lunch[0].split(":")[1]) + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.lunch[1]) + "\n\n\n"
#         end
        
#         if menu.dinner.size == 1
#             message += "저녁" + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.dinner[0].split(":")[1]) + "\n\n"
#         else
#             message += "저녁" + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.dinner[0].split(":")[1]) + "\n\n"
#             message += makeMessageDomiSplit_Cham(menu.dinner[1]) + "\n\n\n"
#         end

#         return message.chop!.chop!.chop!
        message = ""
            
        message += menu.week + "\n\n"

        message += "아침" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.breakfast) + "\n\n"
        message += "점심" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.lunch) + "\n\n"
        message += "저녁" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.dinner)  
        
        return message
    end
    
    def makeMessage_Cham_day(day)
        
        # parser = JBNUDormitoryParser.new
        # menus = parser.requestMenu_Cham
        dormitoryMenuSaver = DormitoryMenuSaver.new
        menus = dormitoryMenuSaver.getDormitoryMenus('cham')[0]
    
        menu = menus[day]
        
        if menu.lunch == ""
            message = "등록된 식단이 없습니다."
            return message
        else
            return makeMessage_Cham(menu)
        end
    end
    
    def makeMessage_Cham_all
        
        # parser = JBNUDormitoryParser.new
        # menus = parser.requestMenu_Cham
        dormitoryMenuSaver = DormitoryMenuSaver.new
        menus = dormitoryMenuSaver.getDormitoryMenus('cham')[0]
        
        message = ""
        
        menus.each do |menu|
            if menu.lunch == ""
                message += menu.week + "\n\n"
                message += "등록된 식단이 없습니다."
            else
                message += makeMessage_Cham(menu)
            end
            
            message += "\n\n"
        end
        
        return message
    end
    
    def makeMessage_Basic(menu)
    
        message = ""
            
        message += menu.week + "\n\n"

        message += "아침" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.breakfast) + "\n\n"
        message += "점심" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.lunch) + "\n\n"
        message += "저녁" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.dinner)  
        
        return message
    end
    
    def makeMessage_Basic_day(day)
        
        # parser = JBNUDormitoryParser.new
        # menus = parser.requestMenu_Basic
        dormitoryMenuSaver = DormitoryMenuSaver.new
        menus = dormitoryMenuSaver.getDormitoryMenus('basic')[0]
   
        menu = menus[day]
        
        if menu.lunch == ""
            
            message = "등록된 식단이 없습니다."
            return message
        else
          return makeMessage_Basic(menu)
        end
    end
    
    def makeMessage_Basic_all
        
        # parser = JBNUDormitoryParser.new
        # menus = parser.requestMenu_Basic
        dormitoryMenuSaver = DormitoryMenuSaver.new
        menus = dormitoryMenuSaver.getDormitoryMenus('basic')[0]
      
        message = ""
        
        menus.each do |menu|
            
            if menu.lunch == ""
                message += menu.week + "\n\n"
                message += "등록된 식단이 없습니다."
            else
                message += makeMessage_Basic(menu)
            end
            
            message += "\n\n"
        end
        
        return message
    end
    
    def makeMessage_special(menu)
    
        message = ""
            
        message += menu.week + "\n\n"
      
        # message += "아침" + "\n\n"
        # message += makeMessageDomiSplit_Basic(menu.breakfast[0].split(": ")[1]) + "\n\n"
        # message += "점심" + "\n\n"
        # makeMessageDomiSplit_Basic(menu.lunch[0].split(": ")[1]).split("(").each do |m|
        #   message += m
        # end
        # if (defined?(menu.lunch[1])).nil? 
        #     makeMessageDomiSplit_Basic(menu.lunch[1]).split("(").each do |m|
        #       message += m + "\n\n"  
        #     end
        # end
        # message +=  "\n\n저녁\n\n"
        # message += makeMessageDomiSplit_Basic(menu.dinner[0].split(": ")[1])
      
        message += "아침" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.breakfast) + "\n\n"
        message += "점심" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.lunch) + "\n\n"
        message += "저녁" + "\n\n"
        message += makeMessageDomiSplit_Basic(menu.dinner)
        
        return message
    end
    
    def makeMessage_special_day(day)
        
        # parser = JBNUDormitoryParser.new
        # menus = parser.requestMenu_special
        dormitoryMenuSaver = DormitoryMenuSaver.new
        menus = dormitoryMenuSaver.getDormitoryMenus('special')[0]
        
        menu = menus[day]
        
        if menu.lunch == ""
            
            message = "등록된 식단이 없습니다."
            return message
        else
          return makeMessage_special(menu)
        end
        
    end
    
    def makeMessage_special_all
        
        # parser = JBNUDormitoryParser.new
        # menus = parser.requestMenu_special
        dormitoryMenuSaver = DormitoryMenuSaver.new
        menus = dormitoryMenuSaver.getDormitoryMenus('special')[0]
      
        message = ""
        
        menus.each do |menu|
            
            if menu.lunch == ""
                message += menu.week + "\n\n"
                message += "등록된 식단이 없습니다."
            else
                message += makeMessage_special(menu)
            end
            
            message += "\n\n"
        end
        
        return message
        
    end

    def makeMessageDomiSplit_Cham(menu_data)
        
        message = ""
        
        # menu_data.split(",").each_with_index do |lunch_d,i|
        #     if i == 0
        #         tmp = lunch_d.split(")")
        #         puts tmp
        #         unless tmp.size == 1
        #             message += tmp[0].strip + ")" + "\n"
        #             message += tmp[1] + "\n"
        #         else
        #             message += lunch_d + "\n"
        #         end
        #     else
        #         message += lunch_d + "\n"
        #     end
        # end
 
        menu_data.split(" ").each_with_index do |lunch_d,i|
            
            if i == 0 or i == 6
                tmp = lunch_d.split(")")
                unless tmp.size == 1
                    if i == 6
                        message += "\n"
                    end
                    message += tmp[0].strip + ")" + "\n"
                    message += tmp[1] + "\n"
                else
                    message += lunch_d + "\n"
                end
            else
                message += lunch_d + "\n"
            end
        end
        
        return message.chop!
    end
    
    def makeMessageDomiSplit_Basic(menu_data)
        
        message = ""
        
        menu_data.split(" ").each_with_index do |lunch_d,i|
            if i == 1
              lunch_d.reverse!
            end
            message += lunch_d.strip + "\n"
    
        end

        return message
    end
end