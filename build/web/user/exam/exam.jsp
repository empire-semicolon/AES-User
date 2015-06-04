<%@page import="org.json.simple.parser.JSONParser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-lg-12">
		<h2 class="page-header">${exam.getExamTitle()}</h2>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-md-10">
		<div class="panel panel-default">
			<div class="panel-body">
                            <form name="theForm" action="submit_exam.htm" method="POST">
				<% int x = 0; %>
                                <c:set var="count" value="0" scope="page" />
				<c:forEach items="${questions}" var="question">
					<div class="row">
						<div class="col-md-4">
                                                    <div class="question">Question #<%=x+1%></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h6>${question}</h6>
						</div>
					</div>
					<div class="row">
                                            <div class="col-md-12">
                                                <c:forEach items="${choices.get(count)}" var="choice">
                                                        <div class="radio">
                                                                <label>
                                                                    <input type="radio" name="radio${count}" value="${choice}"
                                                                           onclick="answeredQuestion()">
                                                                    ${choice}
                                                                </label>
                                                        </div>

                                                </c:forEach>
                                            </div>
					</div>
					<% x++; %>
				<hr/>
                                <c:set var="count" value="${count+1}" scope="page"/>
				</c:forEach>
                                <input type="hidden" id="timeLimit" value="${exam.getTimeLimit()}">
                                <input type="hidden" name="examId" value="${exam.getExamId()}"/>
                                <input type="hidden" id="answers" name="answers" value=" , , , , , , , , , "/>
                                <button class="submit" type="submit">Submit</button>
                            </form>
			</div>
			<div class="row">
				<div class="col-md-4 pull-right">
					<ul class="pagination">
					<li><a href="#" class="disabled">&laquo;</a></li>
					<li><a href="#" class="active">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading">
				Time
			</div>
			<div class="panel-body">
				<h6>${exam.getTimeLimit()} mins</h6>
			</div>
                        <span id="countdown" class="timer"></span>
		</div>
	</div>
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading">
				Questions Answered
			</div>
			<div class="panel-body">
				<input type="text" id="answered" value="0"/>/10
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    var elem=document.getElementById("answered");
    var elem2=document.getElementById("answers");
    var radios=document.querySelectorAll('input[type=radio]');
    var amountAnswered=0;
    
    function answeredQuestion() {
        amountAnswered=0;
        for(var j = 0; j < radios.length; j++) {
            var radio = radios[j];
            if(radio.checked) {
                amountAnswered++;
            }
        }
        elem.value=amountAnswered;
        handleAnswers();
    }
    
    function handleAnswers(){
        var answers="";
        for(var i = 0; i <= 9; i++) {
            var radios2 = document.getElementsByName("radio"+i);
            var answer=" ";
            for(var j = 0; j < radios2.length; j++) {
                var radio2=radios2[j];
                if(radio2.checked){
                    answer=radio2.value;
                }
            }
            answers=answers.concat(answer);
            if(i!=9){
                answers=answers.concat(",");
            }
        }
        elem2.value=answers;
    }
    
</script>

<script>
    var seconds = (document.getElementById("timeLimit").value)*60;
    function secondPassed() {
        var seconds_left=seconds;
        var hours=Math.floor(seconds_left/3600);
        seconds_left-=hours*(3600);
        var minutes = Math.floor(seconds_left/60);
        seconds_left-=minutes*(60);

        if(hours<10){
            hours="0"+hours;
        }
        if(minutes<10){
            minutes="0"+minutes;
        }
        if(seconds_left<10){
            seconds_left="0"+seconds_left;
        }
        
        document.getElementById('countdown').innerHTML = hours + ":" + minutes + ":" + seconds_left;
        if (seconds == 0) {
            clearInterval(countdownTimer);
            document.theForm.submit();
        } else {
            seconds--;
        }
    }

    var countdownTimer = setInterval('secondPassed()', 1000);
</script>