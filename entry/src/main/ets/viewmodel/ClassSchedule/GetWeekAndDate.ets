/**
 * define 2024/09/02 as the Monday of the first week
 * The last Day of a week is Sunday
 */

export default class GetWeekAndDate {
  /**
   * Get the current week number starting from 2024/9/2.
   * 2024/9/2 is considered as the first week.
   * @returns the current week number
   */
  public static getCurrentWeek(): number {
    const startDate = new Date(2024, 8, 2); // September is month 8 (0-based indexing)
    const currentDate = new Date();

    // Calculate the difference in days
    const differenceInTime = currentDate.getTime() - startDate.getTime();
    const differenceInDays = Math.floor(differenceInTime / (1000 * 3600 * 24));

    // Calculate the week number
    const currentWeek = Math.floor(differenceInDays / 7) + 1; // +1 to start from week 1

    return currentWeek;
  }

  /**
   * Get the seven days of the specified week number
   * 2024/9/2 is set as the first week's Monday
   * @param weekNo The week number for which to retrieve the dates
   * @returns Array of Date objects representing the seven days of the specified week
   */
  public static getSevenDaysOfCurrentWeek(weekNo: number): Date[] {
    // Base date for the first Monday (2024-09-02)
    const baseDate = new Date(2024, 8, 2); // Month is 0-indexed, so 8 is September

    // Calculate the start date of the specified week number
    const daysOffset = (weekNo - 1) * 7;
    const weekStartDate = new Date(baseDate);
    weekStartDate.setDate(baseDate.getDate() + daysOffset);

    // Collect seven days of the specified week
    const weekDays: Date[] = [];
    for (let i = 0; i < 7; i++) {
      const currentDay = new Date(weekStartDate);
      currentDay.setDate(weekStartDate.getDate() + i);
      weekDays.push(currentDay);
    }
    return weekDays;
  }

  /**
   * Check if a given date is the same as today
   * @param date The date to compare with today
   * @returns True if the given date is the same as today, otherwise false
   */
  public static isSameToday(date: Date): boolean {
    const today = new Date();
    return (
      date.getFullYear() === today.getFullYear() &&
        date.getMonth() === today.getMonth() &&
        date.getDate() === today.getDate()
    );
  }
}