module Common
    extend ActiveSupport::Concern

    class_methods do
        def get_http_url(short_code)
            url_list = where(short_code: short_code)
            if url_list.length > 0
                return {status:true, url:url_list[0]['http_url'], short_code:url_list[0]['short_code'] }
            else
                return {status: false, message: "Long url not found."}
            end
        end
    end
end