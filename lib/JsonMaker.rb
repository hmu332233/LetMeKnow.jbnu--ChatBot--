class JsonMaker
    
    def getUrlBtnJson(text,label,url)
        
        json = {
            "message": {
                "text": text,
                "message_button": {
                  "label": label,
                  "url": url
                }
            }
        }
        
        return json
        
    end
    
    def getBusMenuJson(text)
        
        json = {
                "message":{
                    "text": text,
                },
                "keyboard": {
                    "type": "buttons",
                    "buttons": [
                        "나가기",
                        "전북대학교(농협앞)",
                        "전북대학교(덕진성당앞)",
                        "전북대학교(일양병원앞)",
                        "전북대학교(한나여성병원)",
                        "소방서(시청방향)",
                        "전북은행본점"
                        ]
                    }
                }
                
        return json
        
    end
    
    def getHelpMenuPicJson(text,photo_url)
        
        json = {
                "message":{
                    "text": text,
                    "photo": {
                        "url": photo_url,
                        "width": 960,
                        "height": 960
                    }
                },
                "keyboard": {
                    "type": "buttons",
                    "buttons": [
                        "나가기",
                        "전체 키워드",
                        "학식 메뉴 확인 키워드",
                        "공지사항 확인 키워드",
                        "학과사무실 정보 확인 키워드",
                        "버스, 버스정류장 확인 키워드",
                        "배달음식점 번호 확인 키워드",
                        "기타 키워드"
                        ]
                    }
                }
        
        return json
        
    end
    
    def getHelpMenuJson(text)
        
        json = {
                "message":{
                    "text": text,
                },
                "keyboard": {
                    "type": "buttons",
                    "buttons": [
                        "나가기",
                        "전체 키워드",
                        "학식 메뉴 확인 키워드",
                        "공지사항 확인 키워드",
                        "학과사무실 정보 확인 키워드",
                        "버스, 버스정류장 확인 키워드",
                        "배달음식점 번호 확인 키워드",
                        "기타 키워드"
                        ]
                    }
                }
        
        
        return json
        
    end
    
end