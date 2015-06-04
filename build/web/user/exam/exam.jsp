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
				<% int x = 0; %>
                                <c:set var="count" value="0" scope="page" />
				<c:forEach items="${questions}" var="question">
					<div class="row">
						<div class="col-md-4">
							<strong>Question #<%=x+1%></strong>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h6>${question}</h6>
						</div>
					</div>
					<div class="row">
                                            <div class="col-md-12">
                                                <form on>
                                                <c:forEach items="${choices.get(count)}" var="cho">
                                                        <div class="radio">
                                                                <label>
                                                                    <input type="radio" name="radios" value="option1"
                                                                           onclick="answeredQuestion()">
                                                                    ${cho}
                                                                </label>
                                                        </div>

                                                </c:forEach>
                                                </form>
                                            </div>
					</div>
					<% x++; %>
				<hr/>
                                <c:set var="count" value="${count+1}" scope="page"/>
				</c:forEach>
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
				<h6>56 mins</h6>
			</div>
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
    var elem = document.getElementById("answered");
    var radios=document.getElementsByName("radios");
    var one=1.0;
    var amountAnswered=0;
    
    //function answeredQuestion(){
      //  elem.value=one+parseInt(elem.value);
    //}
    
    function answeredQuestion() {
        amountAnswered=0;
        for(var j = 0; j < radios.length; j++) {
            var radio = radios[j];
            if(radio.checked) {
                amountAnswered++;
            }
        }
        elem.value=amountAnswered;
    }
</script>