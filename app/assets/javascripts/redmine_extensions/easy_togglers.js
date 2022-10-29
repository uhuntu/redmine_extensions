window.EasyToggler = new function() {
  // EasyToggler storage store object where key is ID of container and value is 0 - for hidden default state or 1 - for shown default state
  // Example:
  // localStorage # => {"easy-toggle-state": {myDiv: 0, history: 1}} # where myDiv is by default hidden, and now will be shown as visible and history is vice versa

  const storage = JSON.parse(localStorage.getItem("easy-toggle-state") || "{}");

  const save = function() {
    localStorage.setItem("easy-toggle-state", JSON.stringify(storage));
    return storage;
  };

  const isHidden = function (el) {
    if (!el) return false;
    const computedStyle = window.getComputedStyle(el);
    return computedStyle.display === "none";
  };

  const toggle = function(el) {
    const parent = el.parentNode;

    parent.classList.toggle("collapsed");

    el.style.display = isHidden(el) ? "block" : "none";
    el.id && !!parent.dataset.toggle && save();
    $( document ).trigger( "erui_interface_change_vertical" ); // <> !#@!
    return el;
  };

  // Toggle specify element OR this - which is toggler button so toggle element is sibling
  this.toggle = function(id_or_el, event) {
    if (event && event.target.tagName === "A")
      return;

    const el = (typeof(id_or_el) === "object") ? id_or_el : document.getElementById(id_or_el);
    const id = el.id;
    if (id) storage[id] = isHidden(el) ? 0 : 1;
    toggle(el);
  };

  this.ensureToggle = function() {
    const list = document.querySelectorAll("*[data-toggle]");
    for (let i = 0; i < list.length; ++i) {
      const item = list.item(i);
      window.EasyToggler.ensureToggleItem(item);
    }
    return this;
  };

  /**
  * @param {HTMLElement} item
  */
  this.ensureToggleItem = function (item) {
    if (storage[item.dataset.toggle] == null) return;
    const container = document.getElementById(item.dataset.toggle);
    const containerState = isHidden(container);
    const savedContainerState = !!storage[item.dataset.toggle];
    if (containerState !== savedContainerState) toggle(container);
    return this;
  };
};

EASY.schedule.main(EasyToggler.ensureToggle);
