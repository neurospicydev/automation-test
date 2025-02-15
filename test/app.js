function changeColor() {
    const colors = ["#FF6B6B", "#4ECDC4", "#45B7D1", "#96CEB4", "#FFEEAD"];
    document.body.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
}
