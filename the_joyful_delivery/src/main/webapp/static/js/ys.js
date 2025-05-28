/**
 * 
 */
/* ========================================================= 이미지 슬라이드 */
// 문서 준비 이벤트
document.addEventListener("DOMContentLoaded", (e) => {
  // 이미지 3장
  const slides = document.querySelector('#main_slide')
  const img = document.querySelectorAll('.main_slide img')
  const count = img.length
  const size = 770
  const delay = 3000
  const speed = 1000
  let index = 0

  // 이미지 슬라이드 복제
  const list = []
  for (let i = 0; i < img.length; i++) {
      const clone = img[i].cloneNode(true)
      list.push(clone)
  }

  // 다 비우고 1번2번 이미지 넣기
  slides.innerHTML = ''
  slides.appendChild(list[index])
  slides.appendChild(list[index+1])

  // 애니메이션
  function animate( value ) {
      for (let i = 0; i < list.length; i++) {
          const slideImg = list[i];
          slideImg.style.transform
           = `translateX( ${value}px )`
      }
  }

  // 슬라이드
  function slide() {
      // 사이즈 만큼 슬라이드
      animate(-size)
      // index 계산
      index = (index + 1) % count
      next = (index + 1) % count
      // 다음 슬라이드로 전환
      setTimeout(() => {
          slides.innerHTML = ''
          animate(0)
          slides.appendChild(list[index])
          slides.appendChild(list[next])
      }, speed)
  }
  // 3초마다 슬라이드
  setInterval( slide, delay )
})
/* ========================================================= 이미지 슬라이드 */

/* ========================================================= 관리자 답변 팝업창 */

document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.open_answer').forEach(function(link) {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      const idx = this.dataset.idx;
      const title = this.dataset.title;
      const date = this.dataset.date;
      const content = this.dataset.content;

      // 모달 안에 데이터 채우기
      const modal = document.getElementById('modal');
      modal.querySelector('p.idx').innerText = idx;
      modal.querySelector('p.title').innerText = title;
      modal.querySelector('p.date').innerText = date;
      modal.querySelector('p.content').innerText = content;

	  // 모달 열기
	  modal.classList.add('active');

    });
  });

  // 닫기 버튼
  document.querySelectorAll('.close').forEach(function(btn) {
    btn.addEventListener('click', function() {
      document.getElementById('modal').classList.remove('active');
    });
  });
});


/* ========================================================= 관리자 답변 팝업창 */