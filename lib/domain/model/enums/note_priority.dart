enum NotePriority {
  trivial,
  minor,
  major,
  critical,
  blocker;

  isTrivial() => this == trivial;

  isMinor() => this == minor;

  isMajor() => this == major;

  isCritical() => this == critical;

  isBlocker() => this == blocker;
}
