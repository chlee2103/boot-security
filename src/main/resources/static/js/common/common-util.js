
var commons = {
    /**
     * ajax 호출
     * @param url
     * @param param
     * @param method
     * @param before
     * @param success
     * @param error
     */
    ajaxCall : function(url, param, method = 'POST', before = null, success = null, error = null) {
        if(method == 'GET' && param) {
            param = $.param(param);
            url += '?' + decodeURIComponent(param);
            param = null;
        }

        $.ajax({
            url : url,
            type : method,
            data : param ? JSON.stringify(param) : null,
            contentType: "application/json",
            beforeSend : function (jqXHR) {
                jqXHR.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
                if (before) before(jqXHR);
            },
            success : function(jqXHR) {
                console.log('is successed', jqXHR);
                if (success) success(jqXHR);
            },
            error : function(err){
                if (error) error(err);
            }
        });
    },
}