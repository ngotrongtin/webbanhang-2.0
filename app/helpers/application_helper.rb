module ApplicationHelper
    def full_title(extra = '')
        base = 'Shopee clone'
        if extra.present?
            extra + ' | ' + base
        else
            base
        end   
    end
end
