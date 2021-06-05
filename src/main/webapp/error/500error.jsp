<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<style type="text/css">
    /*
    HTML 5 Template Name:
    File: 404 - 20 CSS
    Author: OS Templates
    Author URI: http://www.os-templates.com/
    Licence: <a href="http://www.os-templates.com/template-terms">Website Template Licence</a>
    */

    #fof {
        display: block;
        position: relative;
        width: 100%;
        margin: 150px 0;
        text-align: center;
    }

    #fof .positioned {
        display: block;
        width: 85%;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #CCCCCC;
    }

    #fof .positioned h1 {
        margin: 0 0 0 20px;
        padding: 0;
        display: inline;
        font-size: 60px;
        text-transform: uppercase;
    }

    #fof .positioned p {
        margin: 25px 0 0 0;
        padding: 0;
        font-size: 16px;
    }

    #fof a.go-back, #fof a.go-home {
        display: block;
        position: absolute;
        top: 30px;
        width: 100px;
        padding: 20px 0;
        font-size: 20px;
        text-transform: uppercase;
        color: #FFFFFF;
        background-color: #FF6600;
    }

    #fof a.go-back {
        left: 0;
    }

    #fof a.go-home {
        right: 0;
    }

    /* CSS3 Elements Only Work In Latest Browsers */

    #fof .positioned, #fof a.go-back, #fof a.go-home {
        /* Rounded Corners */
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }

</style>

<div class="wrapper row2">
    <div id="container" class="clear">
        <!-- ####################################################################################################### -->
        <!-- ####################################################################################################### -->
        <!-- ####################################################################################################### -->
        <!-- ####################################################################################################### -->
        <section id="fof" class="clear">
            <!-- ####################################################################################################### -->
            <a class="go-back" href="javascript:history.go(-1)">Back<br>&laquo;</a>
            <div class="positioned">
                <h1>페이지가 오류발생 !!</h1>
                <p>페이지의 오류가 발생하였습니다.</p>
                <p>관리자에게 문의하시기 바랍니다</p>
                <p>에러코드 : 500</p>


            </div>
            <a class="go-home" href="index.do">Home<br>&raquo;</a>
            <!-- ####################################################################################################### -->
        </section>
        <!-- ####################################################################################################### -->
        <!-- ####################################################################################################### -->
        <!-- ####################################################################################################### -->
        <!-- ####################################################################################################### -->
    </div>
</div>