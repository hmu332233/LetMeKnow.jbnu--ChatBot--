require 'Menu'
require 'Menu_domitory'
require 'net/http'

class JBNUFoodParser
    
    def requestHTML_Mobile(pageID,day)
        
        uri = URI(URI.encode("http://appdev.jbnu.ac.kr/include/subPage.php?pageID=" + pageID + "&yoil=" + day))
       
        req = Net::HTTP::Get.new(uri)
    
        res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
        doc = Nokogiri::HTML(res.body)
    
        return doc
    end
    
    # 모바일 학식
    def requestMenu_Mobile_Food(pageID_num,day)
        
        case pageID_num
        when 0
            pageID = "ID13367136031"; # 진수당
        when 1
            pageID = "ID13367136161"; # 의대
        when 2
            pageID = "ID13367136271"; # 학생회관
        when 3
            pageID = "ID13407623471"; # 후생관
        when 4
            pageID = "ID13367136711"; # 정담원
        end
        
        doc = requestHTML_Mobile(pageID.to_s,day.to_s)
        
        menu = []
        doc.css('.stxt').each do |rt|
            # puts rt.inner_html.split(" ")
            rt.inner_html.split("<br>").each do |menu_data|
                menu << menu_data
            end
        end
        
        # menu.each_with_index do |m,i|
        
        #     puts i.to_s + " : " + m
        # end
        
        return menu
        
    end

    def requestHTML
        
        uri = URI(URI.encode("http://sobi.chonbuk.ac.kr/chonbuk/m040101"))
       
        req = Net::HTTP::Get.new(uri)
    
        res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
        doc = Nokogiri::HTML(res.body)
    
        return doc
    end
    
    def requestHTML_domitory
        
        uri = URI(URI.encode("http://likehome.chonbuk.ac.kr/board/bbs/board.php?dk_table=cbnu2_7_1_k"))
       
        req = Net::HTTP::Get.new(uri)
    
        res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
        doc = Nokogiri::HTML(res.body)
    
        return doc
        
    end
    
    def requestHTML_domitory2
        
        uri = URI(URI.encode("http://likehome.chonbuk.ac.kr/board/bbs/board.php?dk_table=cbnu2_7_k"))
       
        req = Net::HTTP::Get.new(uri)
    
        res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
        doc = Nokogiri::HTML(res.body)
    
        return doc
        
    end
    
    def requestMenu(place_id)
        
        doc = requestHTML
        
        tables = doc.css("#sub_right//table")
        
        t = tables[place_id].css("tr//td")
        
        rt = []
        t.each_with_index do |a,i|
          a.css("br").each { |node| node.replace("\n") }
          rt << a.text.strip
        end
      
        
        if place_id == 0
            place = "진수원(진수당)"
        elsif place_id == 1
            place = "의대"
        elsif place_id == 2
            place == "학생회관"
        end
        
        menus = [
            Menu.new(place,"월","중식","백반",[rt[9]]),
            Menu.new(place,"화","중식","백반",[rt[10]]),
            Menu.new(place,"수","중식","백반",[rt[11]]),
            Menu.new(place,"목","중식","백반",[rt[12]]),
            Menu.new(place,"금","중식","백반",[rt[13]]),
            Menu.new(place,"월","석식","백반",[rt[17]]),
            Menu.new(place,"화","석식","백반",[rt[18]]),
            Menu.new(place,"수","석식","백반",[rt[19]]),
            Menu.new(place,"목","석식","백반",[rt[20]]),
            Menu.new(place,"금","석식","백반",[rt[21]])
            ]
        
        
        
        return menus
    end
    
    def requestMenu_hu
        
        doc = requestHTML
        
        tables = doc.css("#sub_right//table")
        
        menu_data = tables[3].css("tr//td")
        
        menu = []
        menu_data.each_with_index do |td,i|
            # print i.to_s + " : " + td.inner_text.strip + "\n"
            menu << td.inner_text.strip
        end
        
        
        place = "후생관"
        
        menus = [
            Menu.new(place,"월","중식","특식",[menu[9]]),
            Menu.new(place,"월","중식","찌개",[menu[16]]),
            Menu.new(place,"월","중식","추억의 도시락",[menu[22],menu[27],menu[32]]),
            Menu.new(place,"월","석식","백반",[menu[35],menu[40],menu[45]]),
            Menu.new(place,"화","중식","특식",[menu[10]]),
            Menu.new(place,"화","중식","찌개",[menu[17]]),
            Menu.new(place,"화","중식","추억의 도시락",[menu[23],menu[28],menu[32]]),
            Menu.new(place,"화","석식","백반",[menu[36],menu[41],menu[46]]),
            Menu.new(place,"수","중식","특식",[menu[11]]),
            Menu.new(place,"수","중식","찌개",[menu[18]]),
            Menu.new(place,"수","중식","추억의 도시락",[menu[24],menu[29],menu[32]]),
            Menu.new(place,"수","석식","백반",[menu[37],menu[42],menu[47]]),
            Menu.new(place,"목","중식","특식",[menu[12]]),
            Menu.new(place,"목","중식","찌개",[menu[19]]),
            Menu.new(place,"목","중식","추억의 도시락",[menu[25],menu[30],menu[32]]),
            Menu.new(place,"목","석식","백반",[menu[38],menu[43],menu[48]]),
            Menu.new(place,"금","중식","특식",[menu[13]]),
            Menu.new(place,"금","중식","찌개",[menu[20]]),
            Menu.new(place,"금","중식","추억의 도시락",[menu[26],menu[31],menu[32]]),
            Menu.new(place,"금","석식","백반",[menu[39],menu[44],menu[49]])
            ]
        
       return menus
       
    end
    
    def requesJungdam
        
        doc = requestHTML
        
        tables = doc.css("#sub_right//table")
        
        menu_data = tables[4].css("tr//td")
        

        menu = []
        menu_data.each_with_index do |td,i|
            # print i.to_s + " : " + td.inner_text.strip + "\n"
            menu << td.inner_text.strip
        end
        
        place = "정담원"
        
        menus = [
            Menu.new(place,"월","중식","한식",[menu[9],menu[15],menu[20],menu[25],menu[30]]),
            Menu.new(place,"화","중식","한식",[menu[10],menu[16],menu[21],menu[26],menu[31]]),
            Menu.new(place,"수","중식","한식",[menu[11],menu[17],menu[22],menu[27],menu[32]]),
            Menu.new(place,"목","중식","한식",[menu[12],menu[18],menu[23],menu[28],menu[33]]),
            Menu.new(place,"금","중식","한식",[menu[13],menu[19],menu[24],menu[29],menu[34]])
            ]
        
       return menus
    
    end
    
    def requestMenu_domitory
        
        doc = requestHTML_domitory
         
        tables = doc.css("#box_list2//a")
        
        
        menu_datas = []
        
        tables.each_with_index do |t,i|
            
            # if i < 3 
            #     print i.to_s + t.inner_text.strip + "\n"
            # elsif i >= 3
            #     print i.to_s + t.inner_text.strip.split("//")[0] + "\n"
            #     print i.to_s + t.inner_text.strip.split("//")[1] + "\n"
            # end
            
            menu_datas << t.inner_text.strip.split("//")
            
        end
        
        menus = []
        
        index = 0
        while index < menu_datas.size
            
            menu = Menu_domitory.new("",menu_datas[index],menu_datas[index+1],menu_datas[index+2])
            menus << menu
            
            index += 3

        end
        
        # print menus
        
        return menus
        
    end
    
    def requestMenu_domitory2
        
        doc = requestHTML_domitory2
         
        tables = doc.css("#box_list2//a")
        
        
        menu_datas = []
        
        tables.each_with_index do |t,i|
            
            # if i < 3 
            #     print i.to_s + t.inner_text.strip + "\n"
            # elsif i >= 3
            #     print i.to_s + t.inner_text.strip.split("//")[0] + "\n"
            #     print i.to_s + t.inner_text.strip.split("//")[1] + "\n"
            # end
            
            menu_datas << t.inner_text.strip.split("//")
            
        end
        
        menus = []
        
        index = 0
        while index < menu_datas.size
            
            menu = Menu_domitory.new("",menu_datas[index],menu_datas[index+1],menu_datas[index+2])
            menus << menu
            
            index += 3

        end

        # print menus
        
        return menus
        
    end
    
    def testTables
        
        doc = requestHTML
        
        tables = doc.css("#sub_right//table")
        
        tables.each_with_index do |table,i|
            
            print "\n" +i.to_s + "\n" +table.inner_text
            
        end
        
        
    end
    
    # 모바일
    def requestMenu_hu_mobile(day)
        
        menu_datas = requestMenu_Mobile_Food(3,day)
        
        for i in 0..20
            if menu_datas[i] == nil
                menu_datas[i] = ""
            end
        end
        
        place = "후생관"

        menus = [
            Menu.new(place,day,"중식","특식",[menu_datas[0]]),
            Menu.new(place,day,"중식","찌개",[menu_datas[1]]),
            Menu.new(place,day,"중식","추억의 도시락",[menu_datas[2],menu_datas[3]]),
            Menu.new(place,day,"석식","백반",[menu_datas[4],menu_datas[5],menu_datas[6]]),
            Menu.new(place,day,"중식","오므라이스",[menu_datas[17]])
            ]
        
       return menus
        
    end
    
    def requestMenu_jinsu_mobile(day)
        
        menu_datas = requestMenu_Mobile_Food(0,day)
        
        for i in 0..7
            if menu_datas[i] == nil
                menu_datas[i] = ""
            end
        end
        
        place = "진수당"
        
         menus = [
            Menu.new(place,day,"중식","백반",[menu_datas[0],menu_datas[1],menu_datas[2],menu_datas[3]]),
            Menu.new(place,day,"석식","백반",[menu_datas[4],menu_datas[5],menu_datas[6],menu_datas[7]])
            ]
        
       return menus
        
    end
    
    def requestMenu_medi_mobile(day)
        
        menu_datas = requestMenu_Mobile_Food(1,day)
        
        for i in 0..7
            if menu_datas[i] == nil
                menu_datas[i] = ""
            end
        end
        
        
        place = "의대"
        
         menus = [
            Menu.new(place,day,"중식","백반",[menu_datas[0],menu_datas[1],menu_datas[2],menu_datas[3]]),
            Menu.new(place,day,"석식","백반",[menu_datas[4],menu_datas[5],menu_datas[6],menu_datas[7]])
            ]
        
       return menus
        
    end
    
    
       
    def requestMenu_studentHall_mobile(day)
        
        menu_datas = requestMenu_Mobile_Food(2,day)
        
        for i in 0..9
            if menu_datas[i] == nil
                menu_datas[i] = ""
            end
        end
        
        
        place = "학생회관"
        
         menus = [
            Menu.new(place,day,"중식","백반",[menu_datas[2],menu_datas[3],menu_datas[4],menu_datas[5]]),
            Menu.new(place,day,"석식","백반",[menu_datas[6],menu_datas[7],menu_datas[8],menu_datas[9]])
            ]
        
       return menus
        
    end
    
      def requestMenu_jungdam_mobile(day)
        
        menu_datas = requestMenu_Mobile_Food(4,day)

        for i in 0..4
            if menu_datas[i] == nil
                menu_datas[i] = ""
            end
        end
        
        place = "정담원"
        
        menus = [
            Menu.new(place, day, "중식", "백반", menu_datas[0..4]),
        ]
        
       return menus
        
    end

end