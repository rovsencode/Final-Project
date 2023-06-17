using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class editLike : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(4730),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(6584));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(5438),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(7040));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(4146),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(6175));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(3423),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(5698));

            migrationBuilder.AddColumn<int>(
                name: "DisLikeCount",
                table: "Movie",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "LikeCount",
                table: "Movie",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(2304),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(4718));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(1529),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(4229));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 652, DateTimeKind.Utc).AddTicks(4975),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 513, DateTimeKind.Utc).AddTicks(9487));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 651, DateTimeKind.Utc).AddTicks(8257),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 513, DateTimeKind.Utc).AddTicks(4564));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(6080),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(7627));

            migrationBuilder.CreateTable(
                name: "MovieRaiting",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId1 = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    MovieId = table.Column<int>(type: "int", nullable: false),
                    LikeActive = table.Column<bool>(type: "bit", nullable: false),
                    DisLikeActive = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MovieRaiting", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MovieRaiting_AspNetUsers_UserId1",
                        column: x => x.UserId1,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_MovieRaiting_Movie_MovieId",
                        column: x => x.MovieId,
                        principalTable: "Movie",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MovieRaiting_MovieId",
                table: "MovieRaiting",
                column: "MovieId");

            migrationBuilder.CreateIndex(
                name: "IX_MovieRaiting_UserId1",
                table: "MovieRaiting",
                column: "UserId1");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MovieRaiting");

            migrationBuilder.DropColumn(
                name: "DisLikeCount",
                table: "Movie");

            migrationBuilder.DropColumn(
                name: "LikeCount",
                table: "Movie");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(6584),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(4730));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(7040),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(5438));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(6175),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(4146));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(5698),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(3423));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(4718),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(2304));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(4229),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(1529));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 513, DateTimeKind.Utc).AddTicks(9487),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 652, DateTimeKind.Utc).AddTicks(4975));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 513, DateTimeKind.Utc).AddTicks(4564),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 651, DateTimeKind.Utc).AddTicks(8257));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(7627),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(6080));
        }
    }
}
