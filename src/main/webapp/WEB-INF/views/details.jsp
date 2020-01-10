<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.ahmed.entities.Person" %>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <section id="services">
        <div class="container" style="text-align: right;">
       <form class="form-horizontal" action="details" method="post"> 
       <h1>معلومات شخصيه
                </h1>
                
       <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-2">
                      <label for="usr">الاسم الشخصى:</label>
						<input type="text" class="form-control" id="usr" name="user">
                    </div>
                </div>
       <h1>معلومات خاصه
                </h1>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-2">
                      <label for="inputEmail3" class="col-sm-12 control-label">كم عمرك؟</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check1" id="inlineRadio1" value="1"> 24 سنة
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check1" id="inlineRadio2" value="2"> 30 سنة
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check1" id="inlineRadio2" value="3"> 40 سنة
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check1" id="inlineRadio2" value="4"> 50 سنة
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check1" id="inlineRadio2" value="5"> أكثر
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-2">
                      <label for="inputEmail3" class="col-sm-12 control-label">الجنس </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check2" id="inlineRadio1" value="1"> ذكر
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check2" id="inlineRadio2" value="2"> انثى
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label for="inputEmail3" class="col-sm-12 control-label">اين تعيش ؟</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check3" id="inlineRadio1" value="1">القاهره
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check3" id="inlineRadio2" value="2"> الارياف
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check3" id="inlineRadio2" value="3"> الصعيد
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check3" id="inlineRadio2" value="4">مدينه ساحليه
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check3" id="inlineRadio2" value="5"> سيناء
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label"> ما هي القضية الأكثر أهمية بالنسبة لك كناخب في الانتخابات الرئاسية عام 2016 ؟</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check4" id="inlineRadio1" value="1">الضرائب والإنفاق الحكومي
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check4" id="inlineRadio2" value="2"> السياسة الخارجية
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check4" id="inlineRadio2" value="3"> اقتصاد / البطالة
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check4" id="inlineRadio2" value="4">الجمود السياسيه
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check4" id="inlineRadio2" value="5"> الرعاية الصحية
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	ما هي الخبرة لأكثر أهمية بالنسبة لك في مرشحا للرئاسة؟</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check5" id="inlineRadio1" value="1"> الخبرة  في مجال الأعمال التجارية والمشاريع 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check5" id="inlineRadio2" value="2">  دبلوماسي 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check5" id="inlineRadio2" value="3">رئيس السلطة التنفيذية
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check5" id="inlineRadio2" value="4"> غير متأكد
                        </label>
                    </div>
                </div> 
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">ماهي العبارة الافضل لك</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check6" id="inlineRadio1" value="1">أعتقد أن القوانين وضعت لحماية الناس من الآخرين.
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check6" id="inlineRadio2" value="2">   أود أن تخفف القوانين حتى أتمكن من القيام بكل ما أردت. 
                        </label>
                    </div>
                </div>
                <h1>الحقوق الفردية
                </h1>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">اصدار قانون لتوظيف المزيد من النساء والأقليات </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check7" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check7" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check7" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check7" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check7" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">جعل تسجيل الناخبين أسهل </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check8" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check8" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check8" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check8" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check8" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">تقيد لوائح حماية البيئة </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check9" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check9" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check9" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check9" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check9" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">الاهتمام بحقوق الطفل وحقوق المعاقين </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check10" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check10" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check10" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check10" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check10" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	وضع قوانين لترشيد استخدام المياه</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check11" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check11" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check11" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check11" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check11" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	هل تؤيد حماية المريض وقانون الرعاية بأسعار معقولة</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check12" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check12" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check12" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check12" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check12" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <h1>قضايا محليه
                </h1>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	تشديد العقوبات لتقليلل الجريمة</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check13" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check13" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check13" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check13" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check13" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	الحق المطلق لامتلاك السلاح</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check14" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check14" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check14" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check14" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check14" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">زيادة العناية بالرئيس </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check15" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check15" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check15" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check15" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check15" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	المخدرات هي نوع من أنواع العلاج</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check16" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check16" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check16" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check16" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check16" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	وضع أولويات لدعم الطاقة</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check17" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check17" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check17" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check17" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check17" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <h1>القضايا الاقتصادية
                </h1>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	زيادة الضرائب على الأثرياء</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check18" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check18" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check18" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check18" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check18" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">التحفيز أفضل من الانتعاش الذي تقوده السوق </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check19" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check19" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check19" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check19" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check19" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">خصخصة الضمان الاجتماعي </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check20" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check20" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check20" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check20" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check20" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	توطين  للمهاجرين غير الشرعيين</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check21" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check21" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check21" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check21" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check21" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	استعادة الأمن واستقرار الدولة هوا اول طريق لعلاج القضايا الاقتصادية.</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check22" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check22" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check22" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check22" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check22" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	الاعتماد على الصناعه والتصدير لرفع الاقتصاد.</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check23" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check23" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check23" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check23" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check23" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <h1>الدفاع / القضايا الدولية
                </h1>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	دعم وتوسيع التجارة الحرة</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check24" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check24" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check24" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check24" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check24" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	توسيع الجيش وزيادة التسليح </label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check25" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check25" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check25" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check25" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check25" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">تقليل الأنفاق على المعدات العسكرية</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check26" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check26" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check26" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check26" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check26" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	تجنب التعقيدات الخارجية</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check27" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check27" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check27" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check27" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check27" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">	فتح الحدود بين الدول العربية .</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check28" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check28" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check28" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check28" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check28" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-1">
                      <label class="col-sm-12 control-label">التعاون المشترك بين الدول العربيه في شتى المجالات</label>
                        <label class="radio-inline col-sm-offset-1" >
                          <input type="radio" name="check29" id="inlineRadio1" value="1">غير موافق تماما
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check29" id="inlineRadio2" value="2"> غير موافق 
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check29" id="inlineRadio2" value="3">إلى حد ما  
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check29" id="inlineRadio2" value="4"> موافق      
                        </label>
                        <label class="radio-inline col-sm-offset-1">
                          <input type="radio" name="check29" id="inlineRadio2" value="5">موافق تماما
                        </label>
                    </div>
                </div>
                <div class="col-sm-6 col-sm-offset-1">
                        <input type="submit" class="page-scroll btn btn-xl" value="سجل"/>
                    </div>
         </form>
        </div>
    </section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>