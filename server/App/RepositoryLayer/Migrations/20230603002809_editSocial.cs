using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class editSocial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ImageUrl",
                table: "Social");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 235, DateTimeKind.Utc).AddTicks(4940),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 890, DateTimeKind.Utc).AddTicks(2933));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 234, DateTimeKind.Utc).AddTicks(5341),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 889, DateTimeKind.Utc).AddTicks(5669));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 234, DateTimeKind.Utc).AddTicks(4146),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 889, DateTimeKind.Utc).AddTicks(4672));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 235, DateTimeKind.Utc).AddTicks(6011),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 890, DateTimeKind.Utc).AddTicks(3571));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 235, DateTimeKind.Utc).AddTicks(6887),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 890, DateTimeKind.Utc).AddTicks(4265));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 234, DateTimeKind.Utc).AddTicks(3399),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 889, DateTimeKind.Utc).AddTicks(3994));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 231, DateTimeKind.Utc).AddTicks(846),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 886, DateTimeKind.Utc).AddTicks(9384));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 230, DateTimeKind.Utc).AddTicks(9677),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 886, DateTimeKind.Utc).AddTicks(8127));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 230, DateTimeKind.Utc).AddTicks(8737),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 886, DateTimeKind.Utc).AddTicks(7380));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 229, DateTimeKind.Utc).AddTicks(8504),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 885, DateTimeKind.Utc).AddTicks(9598));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 228, DateTimeKind.Utc).AddTicks(8040),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 885, DateTimeKind.Utc).AddTicks(951));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 228, DateTimeKind.Utc).AddTicks(6851),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 884, DateTimeKind.Utc).AddTicks(9766));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 227, DateTimeKind.Utc).AddTicks(6823),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 884, DateTimeKind.Utc).AddTicks(561));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 890, DateTimeKind.Utc).AddTicks(2933),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 235, DateTimeKind.Utc).AddTicks(4940));

            migrationBuilder.AddColumn<string>(
                name: "ImageUrl",
                table: "Social",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 889, DateTimeKind.Utc).AddTicks(5669),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 234, DateTimeKind.Utc).AddTicks(5341));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 889, DateTimeKind.Utc).AddTicks(4672),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 234, DateTimeKind.Utc).AddTicks(4146));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 890, DateTimeKind.Utc).AddTicks(3571),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 235, DateTimeKind.Utc).AddTicks(6011));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 890, DateTimeKind.Utc).AddTicks(4265),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 235, DateTimeKind.Utc).AddTicks(6887));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 889, DateTimeKind.Utc).AddTicks(3994),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 234, DateTimeKind.Utc).AddTicks(3399));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 886, DateTimeKind.Utc).AddTicks(9384),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 231, DateTimeKind.Utc).AddTicks(846));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 886, DateTimeKind.Utc).AddTicks(8127),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 230, DateTimeKind.Utc).AddTicks(9677));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 886, DateTimeKind.Utc).AddTicks(7380),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 230, DateTimeKind.Utc).AddTicks(8737));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 885, DateTimeKind.Utc).AddTicks(9598),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 229, DateTimeKind.Utc).AddTicks(8504));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 885, DateTimeKind.Utc).AddTicks(951),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 228, DateTimeKind.Utc).AddTicks(8040));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 884, DateTimeKind.Utc).AddTicks(9766),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 228, DateTimeKind.Utc).AddTicks(6851));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 1, 14, 47, 8, 884, DateTimeKind.Utc).AddTicks(561),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 3, 0, 28, 9, 227, DateTimeKind.Utc).AddTicks(6823));
        }
    }
}
