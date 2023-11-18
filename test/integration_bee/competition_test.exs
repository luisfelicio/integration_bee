defmodule IntegrationBee.CompetitionTest do
  use IntegrationBee.DataCase

  alias IntegrationBee.Competition

  describe "students" do
    alias IntegrationBee.Competition.Student

    import IntegrationBee.CompetitionFixtures

    @invalid_attrs %{course: nil, name: nil}

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert Competition.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert Competition.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      valid_attrs = %{course: "some course", name: "some name"}

      assert {:ok, %Student{} = student} = Competition.create_student(valid_attrs)
      assert student.course == "some course"
      assert student.name == "some name"
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Competition.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      update_attrs = %{course: "some updated course", name: "some updated name"}

      assert {:ok, %Student{} = student} = Competition.update_student(student, update_attrs)
      assert student.course == "some updated course"
      assert student.name == "some updated name"
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Competition.update_student(student, @invalid_attrs)
      assert student == Competition.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Competition.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Competition.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Competition.change_student(student)
    end
  end

  describe "matches" do
    alias IntegrationBee.Competition.Match

    import IntegrationBee.CompetitionFixtures

    @invalid_attrs %{winner: nil}

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert Competition.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert Competition.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      valid_attrs = %{winner: "some winner"}

      assert {:ok, %Match{} = match} = Competition.create_match(valid_attrs)
      assert match.winner == "some winner"
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Competition.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      update_attrs = %{winner: "some updated winner"}

      assert {:ok, %Match{} = match} = Competition.update_match(match, update_attrs)
      assert match.winner == "some updated winner"
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = Competition.update_match(match, @invalid_attrs)
      assert match == Competition.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = Competition.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> Competition.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = Competition.change_match(match)
    end
  end
end
