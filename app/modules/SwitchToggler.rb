class SwitchToggler
  def self.toggleUseMobileMenu
    @sw = Sw.find(1)
    @sw.use_mobile_menu = !@sw.use_mobile_menu
    @sw.save
    
    return @sw.use_mobile_menu
  end
  
  def self.toggleUseYesterDayDormitoryMenu
    @sw = Sw.find(1)
    @sw.use_yesterday_domitory_menu = !@sw.use_yesterday_domitory_menu
    @sw.save
    
    return @sw.use_yesterday_domitory_menu
  end
  def self.useYesterDayDormitoryMenu?
    @sw = Sw.find(1)
    return @sw.use_yesterday_domitory_menu
  end
  
  def self.toggleUseDbMenu
    @sw = Sw.find(1)
    @sw.use_db_menu = !@sw.use_db_menu
    @sw.save
    
    return @sw.use_db_menu
  end
end
    