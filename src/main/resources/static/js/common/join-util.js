

var joins = {
    /**
     * 공백체크
     * @param str
     * @returns {boolean}
     */
    nullCheck : function (str){
        if((!str)){
            return true;
        }
        return false;
    },
    /**
     * 아이디체크
     * @param str
     * @return {boolean}
     */
    idCheck : function (str){
        var check = /^[A-Za-z0-9+].{3,25}$/;
        if((!str) || (!check.test(str))){
            return true;
        }
        return false;
    },
    /**
     * 길이체크 : 2글자 이상
     * @param str
     * @returns {boolean}
     */
    lenCheck : function (str){
        if((!str) || (str.length < 2)){
            return true;
        }
        return false;
    },
    /**
     * 숫자 확인
     * @param num
     * @return {boolean}
     */
    numberCheck : function (str){
        console.log(str);
        var check = /[0-9]/g;
        if((!str) || (!check.test(str))){
            return true;
        }
        return false;
    },

    /**
     * 이메일 형식 확인
     * @param str
     * @return {boolean}
     */
    emailCheck : function (str){
        var check = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/;;
        if((!str) || (!check.test(str))){
            return true;
        }
        return false;
    },

    /** 패스워드는 6 ~ 20자 이내 영문 대,소문자, 숫자, 특수문자 혼합 입력
     * 패스워드 형식 확인 : 영문/숫자/특수문자 조합 10자 이상
     * @param str
     * @return {boolean}
     */
    passwordCheck : function (str){
        var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}$/;
        if((!str) || (!check.test(str))){
            return true;
        }
        return false;
    },
    /**
     * 패스워드 재확인
     * @param str
     * @param str2
     * @return {boolean}
     */
    pwConfirmCheck : function (str, str2){
        if((!str2) || (str != str2)){
            return true;
        }
        return false;
    },
    /**
     * 전화번호 하이픈처리
     * @param obj
     */
    phoneKeyup : function (obj){
        $(obj).val($(obj).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-"));
    },

    /**
     * 전화번호 hipen 포함
     * @param str
     * @returns {*}
     */
    phoneCheck : function (str){
        var check = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if((!str) || (!check.test(str))){
            return true;
        }
        return false;
    },

    /**
     * 전화번호 하이픈 제거 : DB 저장시
     * @param str
     * @return {*}
     */
    hyphenClear : function (str){
        return str.replaceAll("-", "");
    },


}

