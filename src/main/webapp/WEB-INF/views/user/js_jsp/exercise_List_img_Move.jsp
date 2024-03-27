<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<script type="text/javascript">
/*
var howtoExerElements = document.querySelectorAll('.move_img');

        howtoExerElements[0].onclick = function() {
            var imageContainers = document.querySelectorAll('.image_container')[0];

                var images = imageContainers.querySelectorAll('img');
                var currentIndex = 0;

                var intervalId = setInterval(function() {
                    images[currentIndex].style.display = 'none';
                    currentIndex = (currentIndex + 1) % images.length;
                    images[currentIndex].style.display = 'block';
                }, 1000); // 이미지를 변경하는 간격 (1.5초)

                // 일정 시간이 지나면 clearInterval을 호출하여 반복 작업을 멈출 수 있습니다.
                setTimeout(function() {
                    clearInterval(intervalId); // setInterval로부터 반환된 intervalId를 사용하여 작업을 멈춥니다.
                    console.log('반복 종료');
                }, 4000); // 6초 후에 실행
        };

        howtoExerElements[1].onclick = function() {
            var imageContainers = document.querySelectorAll('.image_container')[1];

                var images = imageContainers.querySelectorAll('img')
                var currentIndex = 0;

                var intervalId = setInterval(function() {
                    images[currentIndex].style.display = 'none';
                    currentIndex = (currentIndex + 1) % images.length;
                    images[currentIndex].style.display = 'block';
                }, 1000); // 이미지를 변경하는 간격 (1.5초)

                // 일정 시간이 지나면 clearInterval을 호출하여 반복 작업을 멈출 수 있습니다.
                setTimeout(function() {
                    clearInterval(intervalId); // setInterval로부터 반환된 intervalId를 사용하여 작업을 멈춥니다.
                    console.log('반복 종료');
                }, 4000); // 6초 후에 실행

        };
*/

        function exer_How(no){

        var exer_How = document.getElementsByClassName("image_container")[no];


            var images = exer_How.querySelectorAll('img')
            var currentIndex = 0;

            var intervalId = setInterval(function() {
                images[currentIndex].style.display = 'none';
                currentIndex = (currentIndex + 1) % images.length;
                images[currentIndex].style.display = 'block';
            }, 1000); // 이미지를 변경하는 간격 (1.5초)

            // 일정 시간이 지나면 clearInterval을 호출하여 반복 작업을 멈출 수 있습니다.
            setTimeout(function() {
                clearInterval(intervalId); // setInterval로부터 반환된 intervalId를 사용하여 작업을 멈춥니다.
                console.log('반복 종료');
            }, 4000); // 6초 후에 실행
        }

</script>
