defmodule Fakebusters.BoardsTest do
  use Fakebusters.DataCase

  alias Fakebusters.Boards

  describe "boards" do
    alias Fakebusters.Boards.Board

    @valid_attrs %{
      description: "some description",
      fact: "some fact",
      phase: 42,
      rules: "some rules",
      verdict_falsy: 42,
      verdict_truthy: 42
    }
    @update_attrs %{
      description: "some updated description",
      fact: "some updated fact",
      phase: 43,
      rules: "some updated rules",
      verdict_falsy: 43,
      verdict_truthy: 43
    }
    @invalid_attrs %{
      description: nil,
      fact: nil,
      phase: nil,
      rules: nil,
      verdict_falsy: nil,
      verdict_truthy: nil
    }

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Boards.create_board()

      board
    end

    # test "list_boards/0 returns all boards" do
    #   board = board_fixture()
    #   assert Boards.list_boards() == [board]
    # end

    # test "get_board!/1 returns the board with given id" do
    #   board = board_fixture()
    #   assert Boards.get_board!(board.id) == board
    # end

    # test "create_board/1 with valid data creates a board" do
    #   assert {:ok, %Board{} = board} = Boards.create_board(@valid_attrs)
    #   assert board.description == "some description"
    #   assert board.fact == "some fact"
    #   assert board.phase == 42
    #   assert board.rules == "some rules"
    #   assert board.verdict_falsy == 42
    #   assert board.verdict_truthy == 42
    # end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_board(@invalid_attrs)
    end

    # test "update_board/2 with valid data updates the board" do
    #   board = board_fixture()
    #   assert {:ok, %Board{} = board} = Boards.update_board(board, @update_attrs)
    #   assert board.description == "some updated description"
    #   assert board.fact == "some updated fact"
    #   assert board.phase == 43
    #   assert board.rules == "some updated rules"
    #   assert board.verdict_falsy == 43
    #   assert board.verdict_truthy == 43
    # end

    # test "update_board/2 with invalid data returns error changeset" do
    #   board = board_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Boards.update_board(board, @invalid_attrs)
    #   assert board == Boards.get_board!(board.id)
    # end

    # test "delete_board/1 deletes the board" do
    #   board = board_fixture()
    #   assert {:ok, %Board{}} = Boards.delete_board(board)
    #   assert_raise Ecto.NoResultsError, fn -> Boards.get_board!(board.id) end
    # end

    # test "change_board/1 returns a board changeset" do
    #   board = board_fixture()
    #   assert %Ecto.Changeset{} = Boards.change_board(board)
    # end
  end

  describe "board_members" do
    alias Fakebusters.Boards.BoardMember

    @valid_attrs %{role: 42}
    @update_attrs %{role: 43}
    @invalid_attrs %{role: nil}

    def board_member_fixture(attrs \\ %{}) do
      {:ok, board_member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Boards.create_board_member()

      board_member
    end

    test "list_board_members/0 returns all board_members" do
      board_member = board_member_fixture()
      assert Boards.list_board_members() == [board_member]
    end

    test "get_board_member!/1 returns the board_member with given id" do
      board_member = board_member_fixture()
      assert Boards.get_board_member!(board_member.id) == board_member
    end

    test "create_board_member/1 with valid data creates a board_member" do
      assert {:ok, %BoardMember{} = board_member} = Boards.create_board_member(@valid_attrs)
      assert board_member.role == 42
    end

    test "create_board_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_board_member(@invalid_attrs)
    end

    test "update_board_member/2 with valid data updates the board_member" do
      board_member = board_member_fixture()
      assert {:ok, %BoardMember{} = board_member} = Boards.update_board_member(board_member, @update_attrs)
      assert board_member.role == 43
    end

    test "update_board_member/2 with invalid data returns error changeset" do
      board_member = board_member_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_board_member(board_member, @invalid_attrs)
      assert board_member == Boards.get_board_member!(board_member.id)
    end

    test "delete_board_member/1 deletes the board_member" do
      board_member = board_member_fixture()
      assert {:ok, %BoardMember{}} = Boards.delete_board_member(board_member)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_board_member!(board_member.id) end
    end

    test "change_board_member/1 returns a board_member changeset" do
      board_member = board_member_fixture()
      assert %Ecto.Changeset{} = Boards.change_board_member(board_member)
    end
  end
end
