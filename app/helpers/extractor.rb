class Extractor
    
     def extract(message)
        
        entry = nil
        intent = nil
        subIntent = nil
        
        #entry 추출
        notice_keyword = %w[학사공지 일반공지 교내채용 특강 스터디 알바 판매구매 자취 분실물]
        food_keyword = %w[진수 의대 학생회관 후생관 예지원 기존관 참빛 새빛 대동 평화 한빛]
        etc_keyword = %w[치킨집 날씨 도움말 기숙사 긱사 생활관]
        
        entry_list = notice_keyword + food_keyword + etc_keyword
        
        entry_list.each do |entry_candidate|
            
            if message.include?(entry_candidate)
                entry = entry_candidate
            end
        
        end
        
        #intent 추출
        intent_keyword = %w[학생식당 학식 언제 시간]
        
        
        intent_list = intent_keyword
        
        intent_list.each do |intent_candidate|
        
            if message.include?(intent_candidate)
                intent = intent_candidate
            end
        
        end
        
        #subIntent 추출
        date_keyword = %w[내일 모레 주간 이번주]
        
        subIntent_list = date_keyword
        
        subIntent_list.each do |subIntent_candidate|
            
            if message.include?(subIntent_candidate)
                subIntent = subIntent_candidate
            end
            
        end
        
        return [entry,intent,subIntent]
    end
    
end