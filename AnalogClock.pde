class AnalogClock {
  float r;

  AnalogClock() {
    r = CLOCK_SIZE * scaleFactor;
  }

  void drawClock() {
    pushMatrix();
    translate(0, (-HOUSE_HEIGHT + CLOCK_SIZE * 2) * scaleFactor, 
      -HOUSE_WIDTH * scaleFactor + 0.01);

    fill(65);
    noStroke();
    ellipse(0, 0, r * 2, r * 2);

    int hr = hour();
    int mn = minute();
    int sc = second();

    translate(0, 0, 0.001);
    float hourHandAngle = (hr % 12) * 30;
    float hourHandX = cos(-HALF_PI + radians(hourHandAngle)) * (r - 40);
    float hourHandY = sin(-HALF_PI + radians(hourHandAngle)) * (r - 40);
    stroke(255);
    strokeWeight(4);
    line(0, 0, hourHandX, hourHandY);

    float minuteHandAngle = mn * 6;
    float minuteHandX = cos(-HALF_PI + radians(minuteHandAngle)) * (r - 20);
    float minuteHandY = sin(-HALF_PI + radians(minuteHandAngle)) * (r - 20);
    stroke(255, 255, 0);
    strokeWeight(2);
    line(0, 0, minuteHandX, minuteHandY);

    float secondHandAngle = sc * 6;
    float secondHandX = cos(-HALF_PI + radians(secondHandAngle)) * r;
    float secondHandY = sin(-HALF_PI + radians(secondHandAngle)) * r;
    stroke(255, 0, 0);
    strokeWeight(1);
    line(0, 0, secondHandX, secondHandY);

    translate(0, 0, 0.001);
    fill(255);
    textSize(20);
    textAlign(CENTER);
    for (int i = 1; i <= 12; i++) {
      float tX = cos(-HALF_PI + radians(i * 30)) * (r - 20);
      float tY = sin(-HALF_PI + radians(i * 30)) * (r - 20) + 10;
      text(i, tX, tY);
    }

    popMatrix();
  }
}
