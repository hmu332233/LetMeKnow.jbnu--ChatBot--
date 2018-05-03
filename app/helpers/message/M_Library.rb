require 'parser/LibraryParser'

module M_Library

  def makeMessage_library_empty_seat
    parser = LibraryParser.new
    data = parser.requestEmptySeatData[0..17]
    
    text = "◆ 중도 자리 ◆\n\n"
    data.each do |librarySeat|
      text += "#{librarySeat.name}\n사용/총 좌석: #{librarySeat.total}\n\n"
    end
    return "#{text.strip}"
  end
  
  def makeMessage_library_time
    message = "◆ 자료실 
방학 평일 : ~21:00 
휴일 : ~17:00 

◆ 열람실 
4열람실 : 24시 
나머지 : ~24:00 

◆ 편의점 
방학 평일 : 08:30 ~ 20:00 
휴일 : 09:00 ~ 19:00"
    
    return message
  end
end