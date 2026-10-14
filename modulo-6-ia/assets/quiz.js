/* Componente de quiz reutilizable.
   Uso:
   <div class="quiz">
     <p class="q">¿Pregunta?</p>
     <div class="opts">
       <button data-correct="true">Opción correcta</button>
       <button>Opción incorrecta</button>
     </div>
     <div class="explain"><strong>Por qué:</strong> ...</div>
   </div>
*/
(function () {
  function initOne(quiz) {
    var buttons = Array.prototype.slice.call(quiz.querySelectorAll('.opts button'));
    var explain = quiz.querySelector('.explain');
    var answered = false;
    buttons.forEach(function (btn) {
      btn.addEventListener('click', function () {
        if (answered) return;
        answered = true;
        var correct = btn.getAttribute('data-correct') === 'true';
        buttons.forEach(function (b) {
          b.disabled = true;
          if (b.getAttribute('data-correct') === 'true') b.classList.add('correct');
        });
        if (!correct) btn.classList.add('wrong');
        if (explain) explain.classList.add('show');
      });
    });
  }
  function init() {
    Array.prototype.slice.call(document.querySelectorAll('.quiz')).forEach(initOne);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
