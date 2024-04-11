<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
    var RegExp = /^[a-zA-Z0-9]{4,12}$/;
    var n_RegExp = /^[가-힣a-zA-Z]{2,15}$/;

	function createAccountForm() {
		console.log('createAccountForm() CALLED!!');
		
		let form = document.create_account_form;

		if (form.u_m_id.value == '') {
			alert('아이디를 입력해주세요.');
		    form.u_m_id.classList.add("is-invalid");
			form.u_m_id.focus();
            return;
		}

		if (!RegExp.test(form.u_m_id.value)){
            alert('아이디에는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.');
            form.u_m_id.classList.add("is-invalid");
            form.u_m_id.value = '';
            form.u_m_id.focus();
            return;
		}

		if(RegExp.test(form.u_m_id.value)){
		    form.u_m_id.classList.remove("is-invalid");
		    form.u_m_id.classList.add("is-valid");
		}

		if (form.u_m_id.value == form.u_m_pw.value){
		    alert('아이디와 비밀번호를 다르게 입력해주세요.');
		    form.u_m_pw.classList.add("is-invalid");
		    form.u_m_pw.value = '';
		    form.u_m_pw_again.value = '';
		    form.u_m_pw.focus();
            return;
		}

		if (!RegExp.test(form.u_m_pw.value)){
            alert('비밀번호에는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.');
            form.u_m_pw.classList.add("is-invalid");
            form.u_m_pw_again.classList.add("is-invalid");
            form.u_m_pw.value = '';
            form.u_m_pw_again.value = '';
            form.u_m_pw.focus();
            return;
        }

		if (form.u_m_pw.value == '') {
			alert('비밀번호를 입력해주세요.');
			form.u_m_pw.classList.add("is-invalid");
			form.u_m_pw.focus();
			return;
		}

		if (form.u_m_pw_again.value == '') {
			alert('비밀번호 확인을 입력해주세요.');
			form.u_m_pw_again.classList.add("is-invalid");
			form.u_m_pw_again.focus();
			return;
		}

		if (form.u_m_pw.value != form.u_m_pw_again.value) {
			alert('비밀번호를 다시 한번 확인해주세요.');
			form.u_m_pw_again.classList.add("is-invalid");
			form.u_m_pw.classList.remove("is-invalid");
            form.u_m_pw.classList.add("is-valid");
			form.u_m_pw_again.value = '';
			form.u_m_pw_again.focus();
			return;
		}

		if (form.u_m_pw.value === form.u_m_pw_again.value) {
		    form.u_m_pw.classList.remove("is-invalid");
            form.u_m_pw.classList.add("is-valid");
        	form.u_m_pw_again.classList.remove("is-invalid");
            form.u_m_pw_again.classList.add("is-valid");
        }

		if (form.u_m_name.value == '') {
			alert('이름을 입력해주세요.');
			form.u_m_name.classList.add("is-invalid");
			form.u_m_name.focus();
			return;
		}

		if (!n_RegExp.test(form.u_m_name.value)){
            alert('이름에 특수문자 혹은 숫자는 사용할 수 없습니다.');
            form.u_m_name.classList.add("is-invalid");
            form.u_m_name.value = '';
            form.u_m_name.focus();
            return;
		}

		if (n_RegExp.test(form.u_m_name.value)){
            form.u_m_name.classList.remove("is-invalid");
            form.u_m_name.classList.add("is-valid");
        }

		if (form.u_m_gender.value == '') {
			alert('성별을 선택해주세요.');
			form.u_m_gender.classList.add("is-invalid");
			form.u_m_gender.focus();
			return;
		}

		if (form.u_m_gender.value != '') {
		    form.u_m_gender.classList.remove("is-invalid");
        	form.u_m_gender.classList.add("is-valid");
        }

		if (form.u_m_mail.value == '') {
			alert('메일을 입력해주세요.');
			form.u_m_mail.classList.add("is-invalid");
			form.u_m_mail.focus();
			return;
		}

		if(!RegExp.test(form.u_m_mail.value)){
		    alert('이메일에는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.');
		    form.u_m_mail.classList.add("is-invalid");
		    form.u_m_mail.value = '';
		    form.u_m_mail.focus();
            return;
		}

		if(RegExp.test(form.u_m_mail.value)){
		    form.u_m_mail.classList.remove("is-invalid");
        	form.u_m_mail.classList.add("is-valid");
        }

		if (form.u_m_phone.value == '') {
			alert('전화번호를 입력해주세요.');
			form.u_m_phone.classList.add("is-invalid");
			form.u_m_phone.focus();
			return;

		} else {
			form.submit();
			
		}
		
	}

</script>